require_relative '../student'
require_relative '../classroom'

describe Classroom do
  context 'When assigning a student to a class' do
    it 'should assign a student to the class' do
      new_student = Student.new(Classroom.new('CS101'), 12, 'Student1', true)
      new_classroom = Classroom.new('CS101')
      new_classroom.add_student(new_student)

      expect(new_classroom.students[0].name).to eq('Student1')
      expect(new_student.classroom.label).to eq('CS101')
    end
  end
end
