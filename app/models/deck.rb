class Deck < ApplicationRecord
  belongs_to :user

  acts_as_votable

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
