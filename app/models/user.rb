class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :books
  has_many :projects
  has_many :principles
  acts_as_voter
  # has_many :improvements
  has_attached_file :avatar, styles: { medium: "700x700>", thumb: "300x300>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
