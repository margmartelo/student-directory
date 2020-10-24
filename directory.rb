
@students = []

def getting_students(filename = "students.csv") # Here we pass 'students.csv' as a default value
  if File.exist?(filename)
    file = File.open(filename, "r")
    file.readlines.each do |line|
    name, cohort = line.chomp.split(',') # Parallel assignment
      @students << {name: name, cohort: cohort.to_sym}
    end
    file.close
  else
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = STDIN.gets.chomp
    while !name.empty? do
      #add the student hash to the array
      @students << {name: name, cohort: :november}
      puts "Now we have #{@students.count} students"
      # get another name from the user
      name = STDIN.gets.chomp
    end
  end
end

def print_header
  puts "The students of Villians Academy"
  puts "-------------"
end
# Now let's print them
def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  # Printing the total number of students
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a .csv file"
  puts "4. Load the list from a .csv file"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end


def process(selection)
    case selection
    when "1"
      getting_students
    when "2"
      if @students.length != 0
        show_students
      else
        puts "There are currently no students."
      end
    when "3"
      puts "In which file would you like to save the list of students?"
      filename = gets.chomp
      if File.exist?(filename)
        save_students(filename)
      else
        puts "Sorry, that file doesn't exist."
      end
    when "4"
      puts "From which file would you like to load the list of students?"
      filename = gets.chomp
      if File.exist?(filename)
        getting_students(filename)
      else
        puts "Sorry, that file doesn't exist."
      end
    when "9"
      exit #this will cause the program to terminate
    else
      puts "I don't know what you meant,try again"
    end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students(filename)
  # open the file for writing
  file = File.open(filename, "w")
  # iterate over the array of save_students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end


def try_load_students
  filename = ARGV.first # First argument from the command line
  return if filename.nil? # If no file is given, it gets out of the method
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

interactive_menu
