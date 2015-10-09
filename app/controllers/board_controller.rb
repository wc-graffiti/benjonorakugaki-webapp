class BoardController < ApplicationController
  def index
    @spot_id = params[:id]
  end
end
