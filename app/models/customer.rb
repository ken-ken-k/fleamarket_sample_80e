class Customer < ApplicationRecord
  belongs_to :user

  validates :user_id
end
