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


def value_or_default(value, default)
  if value == ""
    value = default
  end
  return value
end

def input_students
  possible_cohorts = [:january, :february, :march, :april, :may, :june, :july,
    :august, :september, :october, :november, :december]

  puts "Please enter the names and cohorts of the students"
  puts "To finish, just hit return twice"

  students = []
  name = value_or_default(gets.strip, "Incognito")
  # Setting the variable 'cohort' as the result of the user input
  cohort = value_or_default(gets.strip, "Unknown").to_sym
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: cohort}
    number_of_students = students.count
    if number_of_students > 1
      puts "Now we have #{number_of_students} students"
    else
      puts "Now we have #{number_of_students} student"
    end

    name = value_or_default(gets.strip, "Incognito")
    cohort = value_or_default(gets.strip, "Unknown").to_sym

    possible_cohorts.push(:Unknown)
    until possible_cohorts.include? cohort
      puts "Please insert your cohort again"
      cohort = value_or_default(gets.strip, "Unknown").to_sym
    end

    if name == "Incognito" && cohort == :Unknown
      break
    end
  end
  students
end


def print_header
  puts "The students of Villians Academy".center(44)
  puts "-------------".center(44)
end
# Now let's print them
def print(students)
  cohort_groups = {
    january: [],
    february: [],
    march: [],
    april: [],
    may: [],
    june: [],
    july: [],
    august: [],
    september: [],
    october: [],
    november: [],
    december: []
  }
  students.each do |student|
    cohort_groups[student[:cohort]].push(student[:name])
  end

  cohort_groups.each do |cohort, name|
    if name.length > 0
      puts "The list of students for #{cohort} is:"
      puts name
    else
      puts "There are no students in #{cohort}."
    end
  end
end

def print_footer(names)
  # Printing the total number of students
  puts "Overall, we have #{names.count} great students".center(44)
end

students = input_students
#Until we call the methods, nothing will happen
print_header
print(students)
print_footer(students)
