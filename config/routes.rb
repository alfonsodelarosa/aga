Rails.application.routes.draw do
  get 'financial_costs/subcontractors'
  get 'financial_costs/materialgroups'
  get 'budgets/originators'
  get 'dashboard/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
