class FinancialCostsController < ApplicationController
  def subcontractors
    @subcontractors_costs = FinancialCost.subcontractors

    #Should be inside Model class

    @dataset = Array.new
    datasets_hash = Hash.new
    datasets_background = Array.new
    datasets_data=Array.new
    labels = Array.new
    cont_of_subcontractor=-1

    @subcontractors_costs.each do |subcontractor|

      labels << subcontractor["item"]

      datasets_background<<"##{Random.new.bytes(3).unpack('H*')[0]}"
      datasets_data << subcontractor["cost"]

      # case cont_of_subcontractor
      #   when 0
      #     datataset_details[:backgroundColor]="#5969ff"
      #   when 1
      #     datataset_details[:backgroundColor]="#5969ff"
      # end
      # cont_of_subcontractor=cont_of_subcontractor+1

    end

    datasets_hash[:backgroundColor]=datasets_background
    datasets_hash[:data]=datasets_data

    @dataset << datasets_hash
    @labels = labels

  end
end
