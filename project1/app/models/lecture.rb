class Lecture < ActiveRecord::Base
  belongs_to :course
  mount_uploader :attachment, AttachmentUploader
  validates :content, presence: true
  has_and_belongs_to_many :users
  acts_as_votable
end
