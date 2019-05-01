class Improvement < ActiveRecord::Base
  # belongs_to :user
  acts_as_votable
  belongs_to :project
  validates_presence_of :title, :author, :description, :principle
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
