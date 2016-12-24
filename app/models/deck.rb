class Deck < ApplicationRecord
  belongs_to :user

  acts_as_votable
end
