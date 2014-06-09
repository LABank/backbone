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
  context 'when signed in' do
    let(:alice) {FactoryGirl.create(:maker)}
    let(:alice_account) { alice.accounts.first }
    before :each do
      alice.accounts.first.update_attribute(:balance, 200)
      sign_in alice
    end
    describe 'new' do    
      it 'should assign @accounts' do
         get :new
         assigns(:transfer).should be_a Transfer
      end
    end
    describe 'create' do 
      let(:bob) {FactoryGirl.create(:maker)}
      let(:bob_account) { bob.accounts.first }
      before :each do
        post :create, transfer: {source_account_uid: alice_account.uid,
                                 destination_account_uid: bob_account.uid,
                                 amount: 100
                                }
      end
      it 'should create a valid transfer' do
        assigns(:transfer).should be_persisted
      end
      it 'should redirect_to the account page' do
        response.should redirect_to accounts_path
      end
      context 'when alice has read only rights on the source account' do
        it 'should refuse the transfer'
      end
      context 'when alice has right on the source account' do
        it 'should refuse the transfer'
      end
      it 'should reject unkown source uid'
      it 'should reject unkown destination uid'

    end
  end
end
