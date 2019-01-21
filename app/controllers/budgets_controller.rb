class BudgetsController < ApplicationController
  def originators
    @originators = Budget.originators
  end
end
