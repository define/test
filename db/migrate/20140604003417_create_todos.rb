class CreateTodos < ActiveRecord::Migration
  def change
	  create_table "todos", :force => true do |t|
		  t.string "name"
		  t.boolean "is_completed"
		  t.integer "priority"
		  t.datetime "created_date", :null => false
		  t.datetime "modified_date", :null => false
		  t.datetime "completed_date"
    end
  end
end

