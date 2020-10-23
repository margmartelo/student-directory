# Creating a hash with the students information: name and cohort
# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Krueger", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :november}
# ]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  @students = []
  name = gets.chomp
  # while the name is not empty (if it isn't empty, 'name.empty?' will evaluate
  # false, so '!name.empty' will evaluate true and continue the loop), repeat
  # this code
  while !name.empty? do
    #add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
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

# def interactive_menu
#   students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
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
      input_students
    when "2"
      show_students
    when "9"
      exit #this will cause the program to terminate
    else
      puts "I don't know what you meant,try again"
    end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

# students = input_students
#Until we call the methods, nothing will happen
# print_header
# print(students)
# print_footer(students)
interactive_menu
