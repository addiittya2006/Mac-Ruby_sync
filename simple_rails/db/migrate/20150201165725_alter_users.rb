class AlterUsers < ActiveRecord::Migration
  
  def up
  	rename_table("users", "admin_users")
  	add_column("admin_users", "username", :string, :limit => 25, :after => "last_name")
  	change_column("admin_users", "last_name", :string, :limit => 25)
  	rename_column("admin_users", "last_name", "lname")
  	puts "###   Adding Index   ###"
  	add_index("admin_users", "username")
  end

  def down
  	remove_index("admin_users", "username")
  	rename_column("admin_users", "lname", "last_name")
  	change_column("admin_users", "last_name", :string, :limit => 20)
  	remove_column("admin_users", "username")
  	rename_table("admin_users", "users")
  end
end
