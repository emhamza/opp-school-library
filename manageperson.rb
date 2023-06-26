def create_teacher
  print "Teacher's Specialization: "
  specialization = gets.chomp
  print "Teacher's age: "
  age = gets.chomp.to_i
  print "Teacher's name: "
  name = gets.chomp

  teacher = Teacher.new(age, name, specialization, parent_permission: true)
  @people << teacher
  puts 'You have successfully registered a Teacher'
end

def create_student
  print 'Age: '
  age = gets.chomp.to_i
  print 'Name: '
  name = gets.chomp
  print 'Has parent permission? [Y/N]: '

  parent_permission = gets.chomp.downcase

  case parent_permission
  when 'n'
    student = Student.new(nil, age, name, parent_permission: false)
    @people << student
  when 'y'
    student = Student.new(nil, age, name, parent_permission: true)
    @people << student
  else
    'You have entered an invalid option'
  end

  puts 'You have successfully registered a Student'
end
