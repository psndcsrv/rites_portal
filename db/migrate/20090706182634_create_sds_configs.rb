class CreateSdsConfigs < ActiveRecord::Migration
  def self.up
    create_table :sds_configs do |t|
      t.integer :configurable_id
      t.string  :configurable_type
      
      t.integer :sds_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sds_configs
  end
end
