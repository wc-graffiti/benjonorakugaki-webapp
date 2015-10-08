class User < ActiveRecord::Base
  has_many :userpoints, dependent: :destroy

  def self.renew
  end
end
