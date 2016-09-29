Rails.application.routes.draw do
  get 'daily_sales/index'

  get 'daily_sales/add'

  get 'report/index'

  get 'report/show'

  get 'report/add'

  post 'report/add' => 'report#create'

  post 'daily_sales/add' => 'daily_sales#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
