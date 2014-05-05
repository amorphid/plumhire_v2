Rails.application.routes.draw do
  root to: "jobs#index"

  resources(
    :applications,
    only: :new
  )

  resources(
    :jobs,
    except: [ :create, :destroy ]
  )
end
