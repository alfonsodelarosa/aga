class FinancialCost
  include ActiveModel::Model

  # convenience method for access to client db
  def self.connection
   ActiveRecord::Base.connection
  end

  # convenience method for execute query
  def self.exec_query(query)
   #Rails.logger.debug("paginate(#{params})")
   self.connection.exec_query(query)
  end

  def self.subcontractors

     query=" SELECT item AS name ,SUM(iss_value) AS value FROM itm,iss WHERE sl_analysis='SUBCONTRAT' AND
     itm.code=iss.item AND when_issued > '2018-09-01' AND when_issued<'2018-10-01'
     GROUP BY item"

     return exec_query(query)
  end

  def self.material_groups

     query=" SELECT sl_analysis AS name, SUM((quantity*value)) AS value FROM itm,soh
     WHERE itm.code=soh.item GROUP BY sl_analysis "

     return exec_query(query)
  end

end
