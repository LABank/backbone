class TransfersController < ApplicationController
  before_filter do 
    authenticate_maker! 
  end
  def new
    @transfer = Transfer.new
  end
  def create
    source = Account.find_by_uid(params[:source_account_uid])
    destination = Account.find_by_uid(params[:source_destination_uid])
    amount = params[:amount]
    @transfer = Transfer.create(source: source, destination: destination, amount: amount)
    redirect_to accounts_path
  end

end
