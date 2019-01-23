class Dashboard
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

  def self.get_client_details_jobs
    query="
    SELECT itm.name AS Articulo, rec.base_quantity AS Pliegos, rec.time_in AS
    Entrada, rec.Loc AS Almacen, rec.del_note AS Albaran, su.su_name AS
    Proveedor, rec.id AS Id_Entrada, itm.fvals_0 AS Ancho, itm.fvals_1 AS
    Largo, itm.fvals_2 AS Peso, rec.batch_ref AS Categoria, iss.Loc,
    iss.qty_iss_base AS Consumo, iss.when_issued AS Fecha_Consumo, wo.wo_job
    FROM ((iss INNER JOIN (itm INNER JOIN (rec INNER JOIN su ON rec.src_code =
    su.su_code) ON itm.code = rec.item) ON iss.rec_id = rec.id) INNER JOIN
    wo_task200 ON iss.iss_task_id = wo_task200.tk_id) INNER JOIN wo ON
    wo_task200.tk_wonum = wo.wo_number
    WHERE (((rec.time_in)>'2017-01-10' AND (rec.time_in)<'2018-01-09' AND
    ((rec.Loc)='PEFCAGA') AND ((iss.Loc)='PEFCAGA'))) LIMIT 0,10;"
    return exec_query(query)
  end
  
end
