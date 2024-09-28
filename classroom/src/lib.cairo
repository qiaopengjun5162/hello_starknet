// CLASSROOM CONTRACT WILL HAVE THE FOLLOW
// add student
// update grade
// get

#[derive(Copy, Drop, Serde, starknet::Store)]
struct Student {
    name: felt252,
    grade: u8,
}

#[starknet::interface]
pub trait IClassroom<TContractState> {
    fn add_student(ref self: TContractState, student_id: felt252, name: felt252, grade: u8);
    fn update_student(ref self: TContractState, student_id: felt252, upgrade: u8);
    fn get_student(self: @TContractState, student_id: felt252) -> Student;
}

#[starknet::contract]
pub mod Classroom {
    use starknet::event::EventEmitter;
    use super::{Student, IClassroom};
    use core::starknet::{
        get_caller_address, ContractAddress,
        storage::{Map, StorageMapReadAccess, StorageMapWriteAccess}
    };
    #[storage]
    struct Storage {
        students: Map<felt252, Student>, // map student_id => student struct
        teacher_address: ContractAddress,
    }

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        StudentAdded: StudentAdded,
        StudentGradeUpdated: StudentGradeUpdated,
    }

    #[derive(Drop, starknet::Event)]
    struct StudentAdded {
        student_id: felt252,
        name: felt252,
        grade: u8,
    }

    #[derive(Drop, starknet::Event)]
    struct StudentGradeUpdated {
        student_id: felt252,
        name: felt252,
        grade: u8,
    }

    #[constructor]
    fn constructor(ref self: ContractState, teacher_address: ContractAddress) {
        self.teacher_address.write(teacher_address)
    }

    #[abi(embed_v0)]
    impl ClassroomImpl of IClassroom<ContractState> {
        fn add_student(ref self: ContractState, student_id: felt252, name: felt252, grade: u8) {
            let teacher_address = self.teacher_address.read();
            assert(get_caller_address() == teacher_address, 'Only Teacher can add a student');
            let student = Student { name: name, grade: grade };
            self.students.write(student_id, student);

            self.emit(StudentAdded { student_id, name, grade });
        }

        fn update_student(ref self: ContractState, student_id: felt252, upgrade: u8) {
            let teacher_address = self.teacher_address.read();
            assert(get_caller_address() == teacher_address, 'cannot update student record');
            let mut student = self.students.read(student_id);
            student.grade = upgrade;
            self.students.write(student_id, student);

            self.emit(StudentGradeUpdated { student_id, name: student.name, grade: upgrade });
        }

        fn get_student(self: @ContractState, student_id: felt252) -> Student {
            self.students.read(student_id)
        }
    }
}
