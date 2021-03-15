Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'patient#login', as: 'patient_login'
  post 'validate_user_details', to: 'patient#validate_user_details', as: 'validate_patient_details'
  get 'available_doctors', to: 'patient#available_doctors', as: 'available_doctors'
  post 'appointemnet/schedule', to: 'appointment#schedule_appointemnet', as: 'schedule_appointemnet'
  get 'appointemnet/new', to: 'appointment#new', as: 'new_appointemnet'
  delete 'cancel_appointement', to: 'appointment#cancel_appointement', as: 'cancel_appointement'
  get 'my_appointements', to: 'patient#my_appointements', as: 'my_appointements'

end
