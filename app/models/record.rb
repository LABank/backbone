class Record < ActiveRecord::Base
  belongs_to :account, inverse_of: :records
  after_create do
    account.update_attribute(:balance, account.balance + self.amount)
  end
end
