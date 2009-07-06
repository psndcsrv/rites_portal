class CreateSdsConfigs < ActiveRecord::Migration
  def self.up
    create_table :sds_configs do |t|
      t.integer :runnable_id
      t.string  :runnable_type
      
      t.integer :sds_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sds_configs
  end
end
