class TimezoneController < ActionController::Base
  def show
    render text: Time.zone
  end
end
