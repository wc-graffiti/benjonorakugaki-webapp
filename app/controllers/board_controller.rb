class BoardController < ApplicationController
  def index
    get_uuid
    @spot_id = params[:id]
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
