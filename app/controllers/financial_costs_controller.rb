class FinancialCostsController < ApplicationController

  def subcontractors
    @subcontractors_costs = FinancialCost.subcontractors
    @polar_stast=helpers.polar_stast_data_structure(@subcontractors_costs)
  end

  def materialgroups
    @material_group_costs = FinancialCost.material_groups
    @doughnut_stast=helpers.doughnut_stast_data_structure(@material_group_costs)
  end

end
