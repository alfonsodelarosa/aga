class BudgetsController < ApplicationController
  def originators
    @originators = Budget.originators
    @months = ['January', 'February', 'March', 'April', 'May', 'Jun', 'July', 'August', 'September', 'October', 'November', 'December']
    #Should be inside Model class
    @data = {
             labels: @months,
             datasets: Array.new
            }

    databasets = Array.new
    name=""
    cont_of_originator=-1

    @originators.each do |originator|

      if name != originator["name"]

        datataset_details = Hash.new
        datataset_details[:label]=originator["name"]
        datataset_details[:data]=Array.new
        datataset_details[:backgroundColor]="rgba(89, 105, 255, 0.5)"
        datataset_details[:borderColor]="rgba(89, 105, 255, 0.7)"
        datataset_details[:borderWidth]=2
        datataset_details[:data]=Array.new
        datataset_details[:data] << originator["num"]

        case cont_of_originator
          when 0
            datataset_details[:backgroundColor]="rgba(255, 64, 123, 0.5)"
            datataset_details[:borderColor]="rgba(255, 64, 123, 0.7)"
          when 1
            datataset_details[:backgroundColor]="rgba(173 ,255, 47, 0.5)"
            datataset_details[:borderColor]="rgba(173 ,255 ,47, 0.7)"
        end

        databasets << datataset_details
        cont_of_originator=cont_of_originator+1
      else
        databasets[cont_of_originator][:data] << originator["num"]
      end

      name=originator["name"]
    end

    @data[:datasets]=databasets

  end
end
