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
# Now let's print them
puts "The students of Villians Academy"
puts "-------------"
students.each do |student|
  puts student
end
# Printing the total number of students
puts "Overall, we have #{students.count} great students"