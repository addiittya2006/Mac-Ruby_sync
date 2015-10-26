class CreateUsers < ActiveRecord::Migration
  
  def up
    create_table :users do |t|
   		t.column "first_name", :string, :limit => 15
    	t.string "last_name", :limit => 20
    	# t.datetime "created_at"
    	# t.datetime "updated_at"
    	t.timestamps
    end
  end

  def down
  	drop_table :users
  end

end