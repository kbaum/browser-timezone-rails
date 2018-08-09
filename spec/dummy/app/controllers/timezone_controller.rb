class TimezoneController < ActionController::Base
  def show
    render plain: Time.zone
  end
end
