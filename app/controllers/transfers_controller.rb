class TransfersController < ApplicationController
  before_filter do 
    authenticate_maker! 
  end
  def new
    @transfer = Transfer.new
  end
  def create
    source = Account.find_by_uid(permitted_params[:source])
    destination = Account.find_by_uid(permitted_params[:destination])
    amount = permitted_params[:amount]
    @transfer = Transfer.create(source: source, destination: destination, amount: amount)
    redirect_to accounts_path
  end

  private    
    def permitted_params
      params.require(:transfer).permit(:amount, :source, :destination)
    end
end
