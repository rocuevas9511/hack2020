class InsightsController < ApplicationController
  def get
    sql = "Select * from users"
    records_array = ActiveRecord::Base.connection.execute(sql)
    render json: records_array.to_json
  end
  def users
    sql = "select users.surname, users.name, count(*) as times from events inner join users on events.eid = users.id where events.eid is not null group by events.eid order by 2 desc;"
    records_array = ActiveRecord::Base.connection.execute(sql)
    render json: records_array.to_json
  end
  def devices

  sql = "select events.hardware_serial, count(*) as times_device from events inner join devices on events.hardware_serial = devices.hardware_serial where events.eid is not null group by events.hardware_serial order by 2 desc;"
    records_array = ActiveRecord::Base.connection.execute(sql)
    render json: records_array.to_json
  end
  def level

    sql = "select `level`,hardware_serial from bacteria_development.events a where a.`time` in
    (select  max(`time`)
    from bacteria_development.events a
    where (eid is not NULL)and (`level` is not NULL)and (metadata is not NULL) 
    group by a.`hardware_serial`)   "
      records_array = ActiveRecord::Base.connection.execute(sql)
      render json: records_array.to_json
    end
    


  def byhardware
      @events = Event.find(params[:hardware_serial])
      render json: @events
    end
end
