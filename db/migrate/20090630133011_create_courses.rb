class CreateCourses < ActiveRecord::Migration
  def self.connection
    RitesPortal::Course.connection
  end
  def self.up
    create_table :courses do |t|
      
      t.integer   "user_id"
      t.string    "uuid",        :limit => 36
      t.string    "name"
      t.text      "description"

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
