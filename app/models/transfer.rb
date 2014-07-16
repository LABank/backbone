class Transfer < ActiveRecord::Base
  belongs_to :maker
  belongs_to :source, class_name: "Account"
  belongs_to :destination, class_name: "Account"
end
