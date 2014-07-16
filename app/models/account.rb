require 'securerandom'

class Account < ActiveRecord::Base
  has_many :records, :inverse_of => :account, :dependent => :destroy
  has_many :credentials, dependent: :destroy, inverse_of: :account

  before_create do
    self.uid ||= SecureRandom.hex(3)
    self.balance ||= 0
  end
end
