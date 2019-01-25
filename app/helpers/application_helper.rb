module ApplicationHelper

  # Return data structure for polar start diagram
  # items = [["name", value (float)]
  def polar_stast_data_structure(items)

    polar_stast = Hash.new
    dataset = Array.new
    labels = Array.new

    datasets_hash = Hash.new
    datasets_background = Array.new
    datasets_data=Array.new

    items.each do |item|
      labels << item["name"]
      datasets_background<<"##{Random.new.bytes(3).unpack('H*')[0]}"
      datasets_data << item["value"]
    end

    datasets_hash[:backgroundColor]=datasets_background
    datasets_hash[:data]=datasets_data
    dataset << datasets_hash

    polar_stast[:dataset]=dataset
    polar_stast[:labels]=labels
    return polar_stast

  end

  # Return data structure for doughnut start diagram
  # items = [["name", value (float)]
  def doughnut_stast_data_structure(items)

    doughnut_stast = Hash.new
    dataset = Array.new
    labels = Array.new

    datasets_hash = Hash.new
    datasets_background = Array.new
    datasets_data=Array.new

    items.each do |item|
      labels << item["name"]
      datasets_background<<"##{Random.new.bytes(3).unpack('H*')[0]}"
      datasets_data << item["value"]
    end

    datasets_hash[:backgroundColor]=datasets_background
    datasets_hash[:data]=datasets_data
    dataset << datasets_hash

    doughnut_stast[:dataset]=dataset
    doughnut_stast[:labels]=labels
    return doughnut_stast

  end

  # Return data structure for doughnut start diagram
  # items = [["name", year, month, value]
  # [
  #  ["Antonio Esteban", 2018, 1, 98],
  #  ["Antonio Esteban", 2018, 2, 166],
  #  ["César Baslán", 2018, 1, 168],
  #  ["César Baslán", 2018, 2, 181]
  # ]
  # Order by name, year, month
  #
  def chartjs_bar_stast_data_structure(items)

    months = ['January', 'February', 'March', 'April', 'May', 'Jun', 'July',
              'August', 'September', 'October', 'November', 'December']

    chartjs_stast = {months: months, datasets: Array.new}

    databasets = Array.new
    name=""
    cont_of_item=-1

    items.each do |item|
      if name != item["name"]
        datataset_details = Hash.new
        datataset_details[:label]=item["name"]
        datataset_details[:data]=Array.new
        datataset_details[:backgroundColor]="##{Random.new.bytes(3).unpack('H*')[0]}"
        datataset_details[:borderColor]="##{Random.new.bytes(3).unpack('H*')[0]}"
        datataset_details[:borderWidth]=2
        datataset_details[:data]=Array.new
        datataset_details[:data] << item["value"]
        databasets << datataset_details
        cont_of_item=cont_of_item+1
      else
        databasets[cont_of_item][:data] << item["value"]
      end
      name=item["name"]
    end

    chartjs_stast[:datasets]=databasets
    chartjs_stast[:months]=months
    return chartjs_stast

  end

end
