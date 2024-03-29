class User < ActiveRecord::Base
  has_many :properties
  has_many :units
  has_many :expenses
  has_many :invoices
  has_many :recurring_events
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
