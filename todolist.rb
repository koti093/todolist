require "date"

class Todo
  def initialize(text, due_date, completed)
    @text = text
    @due_date = due_date
    @completed = completed
    @todaydt = Date.today
  end
  
  def overdue?
    @due_date < @todaydt
  end

  def due_today?
    @due_date == @todaydt
  end

  def due_later?
    @due_date > @todaydt
  end
  
  def to_displayable_string
    # FILL YOUR CODE HERE
    if @completed  then
      @sts = "[X]"
    else
      @sts = "[ ]"
    end
   
    @dt_sts = due_today?  #true nil else dt

    if @dt_sts then
      @dt = nil
    else
      @dt = @due_date
    end
     # final displayable string 
    "#{@sts} #{@text} #{@dt}"
  end

end

class TodosList
  
  def initialize(todos)
    @todos = todos
  end

  def overdue
    TodosList.new(@todos.filter { |todo| todo.overdue? })
  end  
  
  def due_today
    TodosList.new(@todos.filter { |todo| todo.due_today? })
  end
  
  def due_later
    TodosList.new(@todos.filter { |todo| todo.due_later? })
  end
  
  def add(todo_obj)
    @todos.push(todo_obj)
  end

  def to_displayable_list
    # FILL YOUR CODE HERE
    @todos.map { |todo| todo.to_displayable_string }  
  end
end

date = Date.today
todos = [
  { text: "Submit assignment", due_date: date - 1, completed: false },
  { text: "Pay rent", due_date: date, completed: true },
  { text: "File taxes", due_date: date + 1, completed: false },
  { text: "Call Acme Corp.", due_date: date + 1, completed: false },
]

todos = todos.map { |todo|
  Todo.new(todo[:text], todo[:due_date], todo[:completed])
}



todos_list = TodosList.new(todos)


todos_list.add(Todo.new("Service vehicle", date, false))


puts "My Todo-list\n\n"

puts "Overdue\n"
puts todos_list.overdue.to_displayable_list
puts "\n\n"

puts "Due Today\n"
puts todos_list.due_today.to_displayable_list
puts "\n\n"

puts "Due Later\n"
puts todos_list.due_later.to_displayable_list
puts "\n\n"