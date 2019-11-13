class Studio < ApplicationRecord
  has_many :reserves
  has_many :reserve_details
end
