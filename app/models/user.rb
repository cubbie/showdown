class User < ApplicationRecord
  has_many :relationships
  has_many :brackets, through: :relationships
  has_secure_password
end
