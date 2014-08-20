class Todo < ActiveRecord::Base
  attr_accessible :name, :is_completed, :priority, :created_date, :completed_date, :modified_date

	# validates_presence_of :name
	# validates_presence_of :is_completed, :priority, :created_date, :completed_date, :unless => proc { new_record? }
end
