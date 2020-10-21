# Creating an array with the students
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

def print_header
  puts "The students of Villians Academy"
  puts "-------------"
end
# Now let's print them
def print(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
  # Printing the total number of students
  puts "Overall, we have #{names.count} great students"
end
#Until we call the methods, nothing will happen
print_header
print(students)
print_footer(students)
