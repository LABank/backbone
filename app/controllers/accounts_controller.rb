class AccountsController < ApplicationController
  def index
    authenticate_maker! 
    @accounts = current_maker.accounts
  end
end
