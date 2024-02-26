class ToDoList
  def initialize
    @tasks = []
  end

  def add_task(task)
    @tasks << task
    puts "Task '#{task}' added to the list."
  end

  def view_tasks
    puts "List of tasks:"
    @tasks.each_with_index do |task, index|
      puts "#{index + 1}. #{task}"
    end
  end

  def complete_task(task_number)
    task_index = task_number - 1
    if @tasks[task_index]
      puts "Task '#{@tasks[task_index]}' completed."
      @tasks.delete_at(task_index)
    else
      puts "No task with number #{task_number}."
    end
  end

  def delete_task(task_number)
    task_index = task_number - 1
    if @tasks[task_index]
      puts "Task '#{@tasks[task_index]}' removed from the list."
      @tasks.delete_at(task_index)
    else
      puts "No task with number #{task_number}."
    end
  end
end

def main
  todo_list = ToDoList.new

  loop do
    puts "\nChoose an action:"
    puts "1. Add a task"
    puts "2. View tasks"
    puts "3. Mark a task as completed"
    puts "4. Delete task"
    puts "5. Exit"

    choice = gets.chomp.to_i

    case choice
    when 1
      puts "Enter a new task:"
      task = gets.chomp
      todo_list.add_task(task)
    when 2
      todo_list.view_tasks
    when 3
      puts "Enter the number of the completed task:"
      task_number = gets.chomp.to_i
      todo_list.complete_task(task_number)
    when 4
      puts "Enter the task number to delete:"
      task_number = gets.chomp.to_i
      todo_list.delete_task(task_number)
    when 5
      break
    else
      puts "Invalid input. try again."
    end
  end
end

main if __FILE__ == $PROGRAM_NAME

