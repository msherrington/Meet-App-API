class User < ApplicationRecord
  has_secure_password validations: false
  has_many :events_created, class_name: "Event", foreign_key: "user_id"
  has_many :events, through: :tickets
  has_many :tickets
  mount_uploader :image, ImageUploader
  validates :username, uniqueness: true, presence: true, unless: :oauth_login?
  validates :email, uniqueness: true, presence: true, unless: :oauth_login?, on: :create

  def oauth_login?
    github_id.present? || facebook_id.present?
  end
end
