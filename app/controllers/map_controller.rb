class MapController < ApplicationController
  def index
    @points = Point.all
    @hash = Gmaps4rails.build_markers(@points) do |point, marker|
      marker.lat point.lat
      marker.lng point.lon
      marker.infowindow "<a href=\"http://virtual-rakugaki.com/board/#{point.spot_id.to_s}\">#{point.name}</a>"
      marker.json({title: point.name})
    end
  end
end
