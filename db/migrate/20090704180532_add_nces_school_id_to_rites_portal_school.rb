class AddNcesSchoolIdToRitesPortalSchool < ActiveRecord::Migration
  def self.up
    add_column :rites_portal_schools, :nces_school_id, :integer
  end

  def self.down
    remove_column :rites_portal_schools, :nces_school_id
  end
end
