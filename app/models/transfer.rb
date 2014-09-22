class Transfer < ActiveRecord::Base
  belongs_to :maker
  belongs_to :source, class_name: "Account"
  belongs_to :destination, class_name: "Account"
  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }
  
  after_create do
    source = Record.create(account_id: self.source_id,
                                description: self.description,
                                amount: -self.amount,
                                day: self.day,
                                wire_transfer_id: self.id)
    destination = Record.create(account_id: self.destination_id,
                                description: self.description,
                                amount: self.amount,
                                day: self.day,
                                wire_transfer_id: self.id)
  end
end
