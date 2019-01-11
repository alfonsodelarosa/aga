class DashboardController < ApplicationController
  def index
    sql1="SELECT itm.name AS Articulo, rec.base_quantity AS Pliegos, rec.time_in AS
    Entrada, rec.Loc AS Almacen, rec.del_note AS Albaran, su.su_name AS
    Proveedor, rec.id AS Id_Entrada, itm.fvals_0 AS Ancho, itm.fvals_1 AS
    Largo, itm.fvals_2 AS Peso, rec.batch_ref AS Categoria, iss.Loc,
    iss.qty_iss_base AS Consumo, iss.when_issued AS Fecha_Consumo, wo.wo_job
    FROM ((iss INNER JOIN (itm INNER JOIN (rec INNER JOIN su ON rec.src_code =
    su.su_code) ON itm.code = rec.item) ON iss.rec_id = rec.id) INNER JOIN
    wo_task200 ON iss.iss_task_id = wo_task200.tk_id) INNER JOIN wo ON
    wo_task200.tk_wonum = wo.wo_number
    WHERE (((rec.time_in)>'2017-01-10' AND (rec.time_in)<'2018-01-09' AND
    ((rec.Loc)='PEFCAGA') AND ((iss.Loc)='PEFCAGA')));"

    sql2="SELECT job200.j_number AS Pedido, cu.cu_name AS Cliente, job200.j_quantity
AS Cantidad, job200.j_title1 AS Trabajo, job200.j_booked_in AS Fecha_apertura,
job200.j_tech_spec AS Especificaciones, job200.j_estval AS
Importe, est2wo.ew_hdrnum AS Oferta, e4h.eh_cont AS Peticionario,
job200.j_ordnum AS Pedido_Diamond, inv.inv_number AS Factura
FROM inv INNER JOIN (ist INNER JOIN (e4h INNER JOIN (est2wo INNER JOIN
(charge INNER JOIN (wo INNER JOIN (cu INNER JOIN job200 ON cu.cu_code =
job200.j_customer) ON wo.wo_job = job200.j_number) ON charge.cg_job =
job200.j_number) ON est2wo.ew_wonum = wo.wo_number) ON e4h.eh_hdrnum =
est2wo.ew_hdrnum) ON ist.ist_job = job200.j_number) ON inv.inv_id =
ist.ist_inv_id
GROUP BY job200.j_number, cu.cu_name, job200.j_quantity, job200.j_title1,
job200.j_booked_in, job200.j_tech_spec, job200.j_estval, est2wo.ew_hdrnum,
e4h.eh_cont, job200.j_ordnum, inv.inv_number, cu.cu_code, job200.j_state
HAVING (((job200.j_booked_in)>'2017-01-01') AND ((cu.cu_code)='431873') AND
((job200.j_state)<>'S')) ORDER BY Importe DESC;"


   @query2 = ActiveRecord::Base.connection.exec_query(sql2)

  end
end
