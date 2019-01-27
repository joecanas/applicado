Rails.application.routes.draw do
  root "jobs#index"
  # Tell devise to use our registrations controller (to support first/last name for user registrations)
  devise_for :users, :controllers => {registrations: 'registrations'}

  resources :users do
    resources :job_applications, only: [:show, :index]
  end

  resources :jobs, :job_applications

  get "/dashboard" => "jobs#dashboard"
end
