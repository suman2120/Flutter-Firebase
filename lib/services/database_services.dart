import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:learnfirebase/Model/student_model.dart';

class DatabaseServices {
  static FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference students = db.collection('students');

  Future<List<Student>> getAllStudents() async {
    List<Student> studentsList = [];
    final data = await students.get();
    for (var student in data.docs) {
      Map<String, dynamic> studentData = student.data() as Map<String, dynamic>;
      studentData['id'] = student.id;
      //print(student.id);
      studentsList.add(Student.fromJson(studentData));
    }
    return studentsList;
  }

  Future<void> addStudent(Student student) async {
    await students.doc().set(student.studentToMap()).then((value) {
      print('Added successful in database');
    }).catchError((e) {
      print('Unable to add because of $e');
    });
  }

  //delete student
  Future<void> deleteStudent(String id) async {
    await students.doc(id).delete().then((value) {
      print('Deleted successful in database');
    }).catchError((e) {
      print('Unable to delete because of $e');
    });
  }

  Future<void> updateStudent(String id, Student student) async {
    await students.doc(id).update(student.studentToMap()).then((value) {
      print('Updated successfully');
    }).catchError((e) {
      print('Unable to update because of $e');
    });
  }
}
