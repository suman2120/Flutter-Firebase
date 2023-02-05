import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnfirebase/Model/student_model.dart';
import 'package:learnfirebase/services/auth_services.dart';
import 'package:learnfirebase/services/database_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isUpdate = false;

  void clearText() {
    idController.clear();
    nameController.clear();
    addressController.clear();
    phoneController.clear();
    emailController.clear();
  }

  //FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                AuthServices().signOut();
              },
              child: Icon(
                Icons.logout,
                size: 30,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                color: Color.fromARGB(255, 218, 215, 215),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: idController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Enter Id',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Enter Name',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: addressController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Enter Address',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Enter Phone',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Enter Email',
                          ),
                        ),
                      ),
                     
                     

                     isUpdate == false? ElevatedButton(
                      onPressed: (){

                         Student student = Student(
                                      name: nameController.text,
                                      address: addressController.text,
                                      phone: phoneController.text,
                                      email: emailController.text);
                                  DatabaseServices().addStudent(student);

                                  clearText();
                                  setState(() {
                                    
                                  });

                       



                      },

                      child:  Text(" Add"),

                     ): ElevatedButton(onPressed: (){

                        Student student = Student(
                                        id: idController.text,
                                        name: nameController.text,
                                        address: addressController.text,
                                        phone: phoneController.text,
                                        email: emailController.text);
                                    DatabaseServices().updateStudent(
                                        idController.text, student);
                                    isUpdate = false;
                                    clearText();
                                    setState(() {
                                      
                                    });




                     }, child: Text("Update"))
                     
                     
                      // isUpdate == false
                      //     ? ElevatedButton(
                      //         onPressed: () {
                      //           setState(() {
                      //             Student student = Student(
                      //                 name: nameController.text,
                      //                 address: addressController.text,
                      //                 phone: phoneController.text,
                      //                 email: emailController.text);
                      //             DatabaseServices().addStudent(student);
                      //             clearText();
                      //           });
                      //         },
                      //         child: Text('Add Student'))
                      //     : ElevatedButton(
                      //         onPressed: () {
                      //           setState(() {
                      //             Student student = Student(
                      //                 id: idController.text,
                      //                 name: nameController.text,
                      //                 address: addressController.text,
                      //                 phone: phoneController.text,
                      //                 email: emailController.text);
                      //             DatabaseServices().updateStudent(
                      //                 idController.text, student);
                      //             isUpdate = false;
                      //             clearText();
                      //           });
                      //         },
                      //         child: Text('Update Student'))
                    ],
                  ),
                ),
              )),
          FutureBuilder(
            future: DatabaseServices().getAllStudents(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Student> data = snapshot.data as List<Student>;

                return Expanded(
                    flex: 2,
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              // height: MediaQuery.of(context).size.height* 0.5,
                              decoration: BoxDecoration(color: Color.fromARGB(255, 236, 211, 135),
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Column(
                                        children: [
                                          Text(data[index].name!,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25)),
                                          Text(data[index].address!,
                                              style: TextStyle(fontSize: 20)),
                                          Text(data[index].email!,
                                              style: TextStyle(fontSize: 20)),
                                          Text(data[index].phone!,
                                              style: TextStyle(fontSize: 20)),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                              onPressed: () {
                                                isUpdate = true;

                                                setState(() {
                                                  idController.text = data[index].id!;
                                                  nameController.text = data[index].name!;
                                                  addressController.text = data[index].address!;
                                                  phoneController.text = data[index].phone!;
                                                  emailController.text = data[index].email!;

                                                });
                                                // setState(() {
                                                //   isUpdate = true;
                                                //   idController.text =
                                                //       data[index].id.toString();
                                                //   nameController.text =
                                                //       data[index].name!;
                                                //   addressController.text =
                                                //       data[index].address!;
                                                //   phoneController.text =
                                                //       data[index].phone!;
                                                //   emailController.text =
                                                //       data[index].email!;
                                                // });
                                              },
                                              child: Icon(
                                                Icons.edit,
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.red)),
                                              onPressed: () {
                                                setState(() {
                                                  DatabaseServices()
                                                      .deleteStudent(data[index]
                                                          .id
                                                          .toString());
                                                });
                                              },
                                              child: Icon(
                                                Icons.delete,
                                              )),
                                        ),
                                      ],
                                    )
                                  ]),
                            ),
                          );
                        })));
              } else {
                return const Text('Loading');
              }
            },
          ),
        ],
      ),
    );
  }
}
