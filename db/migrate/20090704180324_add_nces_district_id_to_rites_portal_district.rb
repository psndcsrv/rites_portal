class AddNcesDistrictIdToRitesPortalDistrict < ActiveRecord::Migration
  def self.up
    add_column :rites_portal_districts, :nces_district_id, :integer
  end

  def self.down
    remove_column :rites_portal_districts, :nces_district_id
  end
end
