class TimezoneController < ApplicationController

  def show

    render text: Time.zone
    
  end



end
