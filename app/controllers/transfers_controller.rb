class TransfersController < ApplicationController
  before_filter do 
    authenticate_maker! 
  end
  def new
    @transfer = Transfer.new
  end

  def check_source 
    source = Account.find_by_uid(permitted_params[:source])
    unless source
      redirect_to new_transfer_path
      flash[:error] = "Unknown source uid"
    end
    return source
  end

  def check_destination
    destination = Account.find_by_uid(permitted_params[:destination])
    unless destination
      redirect_to new_transfer_path
      flash[:error] = "Unknown destination uid"
    end
    return destination
  end

  def create
    source = check_source
    destination = check_destination
    if source && destination
      credential = Credential.where(maker: current_maker, account: source).first

      if credential && credential.right == 'write'
        amount = permitted_params[:amount]
        description = permitted_params[:description]
        @transfer = Transfer.create(source: source, 
                                    destination: destination, 
                                    amount: amount, 
                                    day: Date.today, 
                                    description: description,
                                    maker: current_maker)
        redirect_to accounts_path
      else
        flash[:error] = "You don't have the permission to access this account"
        redirect_to new_transfer_path
      end
    end
  end

  private    
    def permitted_params
      params.require(:transfer).permit(:amount, :source, :destination, :description)
    end
end
