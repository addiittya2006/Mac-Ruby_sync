class TodoItem < ActiveRecord::Base

  belongs_to :todo_list
  # has_many :users, through: :todo_lists

  default_scope {order due_date: :asc}

end
