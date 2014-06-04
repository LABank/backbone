class Account < ActiveRecord::Base
  has_many :records, :inverse_of => :account, :dependent => :destroy
  has_many :credentials, dependent: :destroy, inverse_of: :account
end
