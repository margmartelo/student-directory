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
  puts "Please enter the names and the hobbies of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp
  hobbies = gets.chomp
  country_of_birth = gets.chomp
  height = gets.chomp

  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november, hobbies: hobbies,
      country_of_birth: country_of_birth, height: height}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
    break if name.empty?
    hobbies = gets.chomp
    country_of_birth = gets.chomp
    height = gets.chomp
  end

  return students
end


def print_header
  puts "The students of Villians Academy"
  puts "-------------"
end

# Now let's print all students using a while loop
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort) hobbies: #{student[:hobbies]},
    country of birth: #{student[:country_of_birth]}, height: #{student[:height]}"
  end
end


def print_footer(names)
  # Printing the total number of students
  puts "Overall, we have #{names.count} great students"
end

students = input_students
# #Until we call the methods, nothing will happen
print_header
print(students)
print_footer(students)
