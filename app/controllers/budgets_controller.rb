class BudgetsController < ApplicationController
  def originators
    @originators = Budget.originators
    @chartjs_stast=helpers.chartjs_bar_stast_data_structure(@originators)
  end
end
