class Record < ActiveRecord::Base
  belongs_to :account, inverse_of: :records
end
