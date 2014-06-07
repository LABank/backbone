require 'spec_helper'

describe AccountsController do
  context 'when not signed in' do
    it 'should not show :index page' do
      get :index
      response.should redirect_to new_maker_session_path
    end
  end
  context 'when signed in' do
  before :each do
    @maker = FactoryGirl.create(:maker)
    sign_in @maker
  end
  describe 'index' do 
    it 'should assign @accounts' do
       get :index
       assigns(:accounts).should eq(@maker.accounts)
    end
  end
  end
end
