require 'spec_helper'

describe TransfersController do
  context 'when not signed in' do
    it 'should not show :new page' do
      get :new
      response.should redirect_to new_maker_session_path
    end
    it 'should not try to :create' do
      post :create
      response.should redirect_to new_maker_session_path
    end
  end
  context 'when signed in,' do
    let(:alice) {FactoryGirl.create(:maker)}
    let(:alice_account) { alice.accounts.first }
    before :each do
      alice.accounts.first.update_attribute(:balance, 200)
      sign_in alice
    end
    describe '#new' do    
      it 'should assign @accounts' do
         get :new
         assigns(:transfer).should be_a Transfer
      end
    end
    describe '#create' do 
      let(:bob) {FactoryGirl.create(:maker)}
      let(:bob_account) { bob.accounts.first }
      before :each do
        post :create, transfer: {source: alice_account.uid,
                                 destination: bob_account.uid,
                                 amount: 100,
                                 description: "This is the description"
                                }
      end
      it 'should create a valid transfer' do
        assigns(:transfer).should be_persisted
      end
      it 'should auto assign the current date' do
        assigns(:transfer).day.should eq(Date.today)
      end
      it 'should respect assigned values' do
        transfer = assigns(:transfer)
        transfer.amount.should eq(100)
        transfer.source.should eq(alice_account)
        transfer.destination.should eq(bob_account)
        transfer.description.should eq("This is the description")
        transfer.maker.should eq(alice)
      end
      it 'should redirect_to the account page' do
        response.should redirect_to accounts_path
      end
      context 'when alice has read only rights on the source account' do
        it 'should refuse the transfer' do
          account = FactoryGirl.create(:account)
          FactoryGirl.create(:credential, maker: alice, account: account, right: 'read')
          post :create, transfer: { source: account.uid,
                                    destination: bob_account.uid,
                                    amount: 100 }
          response.should redirect_to new_transfer_path
          flash[:error].should_not be_nil
        end
      end
      context 'when alice has no right on the source account' do
        it 'should refuse the transfer' do
          account = FactoryGirl.create(:account)
          post :create, transfer: { source: account.uid,
                                    destination: bob_account.uid,
                                    amount: 100 }
          response.should redirect_to new_transfer_path
          flash[:error].should_not be_nil
        end
      end
      it 'should reject unkown source uid' do
        post :create, transfer: { source: 'unkown',
                                    destination: bob_account.uid,
                                    amount: 100 }
        response.should redirect_to new_transfer_path
        flash[:error].should_not be_nil
      end
      it 'should reject unkown destination uid' do
        post :create, transfer: { source: alice_account.uid,
                                    destination: 'unkown',
                                    amount: 100 }
        response.should redirect_to new_transfer_path
        flash[:error].should_not be_nil
      end
    end
  end
end
