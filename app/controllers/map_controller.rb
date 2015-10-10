class MapController < ApplicationController
  def index
    get_uuid
    userpoints = UserPoint.find_by(user_id: @user.id)
    @points = Point.all
    @hash = Gmaps4rails.build_markers(@points) do |point, marker|
      marker.lat point.lat
      marker.lng point.lon
      if userpoints.blank? || userpoints.find_by(point_id: point.id).blank?
        pin = {
          url: 'http://192.168.5.2:3000/assets/pin1.png',
          width: 32,
          height: 32
        }
      else
        pin = {
          url: 'http://192.168.5.2:3000/assets/pin2.png',
          width: 32,
          height: 32
        }
      end
      marker.picture pin.to_json
      marker.infowindow "<a href=\"http://virtual-rakugaki.com/board/#{point.spot_id.to_s}\">#{point.name}</a>"
      marker.json({title: point.name})
    end
  end

  private
  
  def get_uuid
    @uuid = cookies[:uuid]
    if @uuid.blank?
      @uuid = SecureRandom.uuid
      cookies[:uuid] = {value: @uuid, expires: 1.week.from_now}
      @user = User.create({
        uuid: @uuid,
        achieve: false,
      })
    else
      @user = User.find_by(uuid: @uuid)
    end
  end
end
