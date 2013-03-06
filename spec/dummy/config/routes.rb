Rails.application.routes.draw do

  mount BrowserTzone::Engine => "/browser_tzone"

  resource :timezone, only: :show, controller: 'timezone'
end
