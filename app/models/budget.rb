class Budget
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

  def self.originators
    query="
     SELECT orig_name,COUNT(*) AS num
     FROM e4h,orig WHERE e4h.eh_orig = orig.orig_code AND eh_date > '2018-01-01' AND
     (orig_name LIKE '%Antonio Esteban%' OR orig_name LIKE '%César Baslán%'
     OR orig_name LIKE '%Cristina González%' ) GROUP BY orig_name;"

     return exec_query(query)
  end

end
