class Transfer < ActiveRecord::Base
  belongs_to :maker
  belongs_to :source, class_name: :account
  belongs_to :destination, class_name: :account
end
