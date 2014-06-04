class Maker < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :memberships, dependent: :destroy
  has_many :credentials, dependent: :destroy, inverse_of: :maker

  validates_presence_of :first_name, :last_name
  def to_label
    "#{last_name} #{first_name}"
  end
end
