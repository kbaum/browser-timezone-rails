Rails.application.routes.draw do
  resource :timezone, only: :show, controller: 'timezone'
end
