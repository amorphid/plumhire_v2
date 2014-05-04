Rails.application.routes.draw do
  root to: "jobs#index"

  resources(
    :jobs,
    only: [
      :index,
      :new,
      :show,
      :update
    ]
  )
end
