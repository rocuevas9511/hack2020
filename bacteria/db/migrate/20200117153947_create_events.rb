class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :hardware_serial
      t.json :payload_fields
      t.virtual :eid ,type: :string,as: "JSON_UNQUOTE(JSON_EXTRACT(payload_fields, '$.eid'))", stored:true
      t.virtual :level, type: :integer,as: "JSON_UNQUOTE(JSON_EXTRACT(payload_fields, '$.level'))", stored:true
      t.json :metadata
      t.virtual :time,type: :string,as: "JSON_UNQUOTE(JSON_EXTRACT(metadata, '$.time'))", stored:true

      t.timestamps
    end
    add_index :events, :hardware_serial
    add_index :events, :eid
    add_index :events, :time
  end
end
