class Point < ActiveRecord::Base
  has_many :userpoints, dependent: :destroy

  # 更新メソッド 基本的に呼ばない．初期化の時のみ．
  def self.renew
   require 'net/http'
   require 'uri'
   require 'json'

   Point.delete_all
   uri = URI.parse("http://27.120.85.147:4649/api/v1/spot/#{Constants::TUTLAT}/#{Constants::TUTLON}/#{Constants::DEFACC}")
   json = Net::HTTP.get(uri)
   result = JSON.parse(json, {:symbolize_names => true})
   result.each do |elem|
     Point.create({
       spot_id: elem[:id].to_i,
       name:    elem[:name],
       lat:     elem[:lat].to_f,
       lon:     elem[:lon].to_f
     })
   end
   Point.all
  end
end
