class Point < ActiveRecord::Base
  has_many :userpoints, dependent: :destroy
end
