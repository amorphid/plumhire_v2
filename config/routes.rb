Rails.application.routes.draw do
  root to: "jobs#index"

  resources(
    :jobs,
    only: [
      :edit,
      :index,
      :new,
      :show,
      :update
    ]
  )
end
