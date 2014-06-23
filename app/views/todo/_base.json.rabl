attributes :id, :name, :is_completed, :priority, :created_date, :modified_date, :completed_date

node do |tod|
{
	:created_formatted =>  tod.created_date.to_s,
	:modified_formatted =>  tod.modified_date.to_s,
	:modified_ago =>  time_ago_in_words(tod.modified_date),
	:completed_formatted =>  tod.completed_date.to_s,
}
end