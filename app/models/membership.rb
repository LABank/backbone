class Membership < ActiveRecord::Base
  belongs_to :maker
  belongs_to :entity
end
