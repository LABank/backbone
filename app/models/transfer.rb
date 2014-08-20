class Transfer < ActiveRecord::Base
  belongs_to :maker
  belongs_to :source, class_name: "Account"
  belongs_to :destination, class_name: "Account"

  before_create do
    source = Record.create(account_id: self.source_id,
                                description: self.description,
                                amount: -self.amount,
                                day: self.day)
    destination = Record.create(account_id: self.destination_id,
                                description: self.description,
                                amount: self.amount,
                                day: self.day)
  end
end
