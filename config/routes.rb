Rails.application.routes.draw do
  root to: "jobs#index"

  resources(
    :applications,
    only: [ :new, :show, :update ]
  )

  resources(
    :jobs,
    except: [ :create, :destroy ]
  )
end
