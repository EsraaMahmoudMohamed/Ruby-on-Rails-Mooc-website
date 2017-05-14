class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :picture, ImageUploader
  has_many :courses, :dependent => :delete_all
  has_many :comments, :dependent => :delete_all
  has_and_belongs_to_many :lectures
  validates_processing_of :picture
  validate :image_size_validation
  # validates :name, length: { maximum: 30 }, presence: true
  # validates :gender, inclusion: { in: %w(female male)}


  validate :date_of_birth_cannot_be_in_the_present

  def date_of_birth_cannot_be_in_the_present
    if dob.present? && dob > Date.today
      errors.add(:dob, "can't be in the present")
    end
  end

  private
  def image_size_validation
    errors[:picture] << "should be less than 500KB" if picture.size > 0.5.megabytes
  end
end
