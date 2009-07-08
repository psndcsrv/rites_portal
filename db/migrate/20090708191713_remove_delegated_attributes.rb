class RemoveDelegatedAttributes < ActiveRecord::Migration
  def self.up
    remove_column :rites_portal_teachers, :name
    remove_column :rites_portal_teachers, :description
    remove_column :rites_portal_students, :name
    remove_column :rites_portal_students, :description
    remove_column :rites_portal_offerings, :name
    remove_column :rites_portal_offerings, :description
    remove_column :rites_portal_learners, :name
    remove_column :rites_portal_learners, :description
  end

  def self.down
    add_column :rites_portal_teachers, :name, :string
    add_column :rites_portal_teachers, :description, :text
    add_column :rites_portal_students, :name, :string
    add_column :rites_portal_students, :description, :text
    add_column :rites_portal_offerings, :name, :string
    add_column :rites_portal_offerings, :description, :text
    add_column :rites_portal_learners, :name, :string
    add_column :rites_portal_learners, :description, :text
  end
end
