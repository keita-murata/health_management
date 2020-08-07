Rails.application.routes.draw do
  root "top_pages#home"
  get  "top_pages/help"
  get  "top_pages/message"
end
