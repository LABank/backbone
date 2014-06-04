class Credential < ActiveRecord::Base
  belongs_to :maker, inverse_of: :credentials
  belongs_to :account, inverse_of: :credentials

end
