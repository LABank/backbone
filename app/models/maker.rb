class Maker < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable#, :validatable, :registerable
  
  has_many :memberships, dependent: :destroy
  has_many :credentials, dependent: :destroy, inverse_of: :maker
  has_many :accounts, through: :credentials

  validates_presence_of :first_name, :last_name
  def to_label
    "#{last_name} #{first_name}"
  end
  alias_method :name, :to_label
  default_scope { order('last_name, first_name') }

  after_create :create_account

  def create_account
    account = Account.create(name: self.to_label)
    self.credentials.create(account_id: account.id, right: 'write') if account.persisted?
    return account
  end
end
