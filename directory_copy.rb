# Creating a hash with the students information: name and cohort
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

# def input_students
#   puts "Please enter the names of the students"
#   puts "To finish, just hit return twice"
#
#   students = []
#   name = gets.chomp
#   # while the name is not empty (if it isn't empty, 'name.empty?' will evaluate
#   # false, so '!name.empty' will evaluate true and continue the loop), repeat
#   # this code
#   while !name.empty? do
#     #add the student hash to the array
#     students << {name: name, cohort: :november}
#     puts "Now we have #{students.count} students"
#     # get another name from the user
#     name = gets.chomp
#   end
#
#   students
# end
#
# def print_header
#   puts "The students of Villians Academy"
#   puts "-------------"
# end
# Now let's print the students whose name is shorter than 12 characters.
def print(students)
  students.each_with_index do |(student), index|
    if student[:name].length < 12
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end


# def print_footer(names)
#   # Printing the total number of students
#   puts "Overall, we have #{names.count} great students"
# end

# students = input_students
# #Until we call the methods, nothing will happen
# print_header
print(students)
# print_footer(students)
