require 'csv'

@students = []

def read_students_from(filename = "students.csv")
  if File.exist?(filename)
    @students = []
    CSV.foreach(filename, "r") do |line|
        name, cohort = line[0], line[1]
        @students << {name: name, cohort: cohort.to_sym}
    end
  end
end

def students_from_stdin
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def save_students(filename)
  CSV.open(filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      file << student_data
    end
  end
end

def print_header
  puts "The students of Villians Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
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
    students_from_stdin
  when "2"
    if @students.length != 0
      show_students
    else
      puts "There are currently no students."
    end
  when "3"
    puts "In which file would you like to save the list of students? Please, specify the path."
    filename = gets.chomp
    save_students(filename)
  when "4"
    puts "From which file would you like to load the list of students? Please, specify the path."
    filename = gets.chomp
    if File.exist?(filename)
      read_students_from(filename)
    else
      puts "Sorry, that file doesn't exist."
    end
  when "9"
    exit
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

read_students_from
interactive_menu
