class User < ApplicationRecord
 # validates :name, presence: true
 validates :name, presence: true ,length: { maximum: 50}
 validates :email, presence: true, length: {maximum: 100 }
  # validates :email, format: { with: /<regular expression>/ }
end
