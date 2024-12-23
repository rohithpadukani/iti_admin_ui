import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iti_admin_mod/models/db.dart';
import 'package:iti_admin_mod/views/add_student_form.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  List<String> list = <String>['All','Course 1', 'Course 2', 'Course 3', 'Course 4'];
  List<String> year = <String>['2022', '2023', '2024',];

  @override
  Widget build(BuildContext context) {
    String dropDownValue = list.first;
    String yearDropDownValue = year.first;
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
      width: double.infinity,
      color: const Color(0xfff5f5f5),
      //main column
      child: Column(
        children: [
          const SizedBox(
            width: 20,
          ),
          //headers row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Students',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Text(
                    'Year: ',
                    style: TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownMenu<String>(
                      initialSelection: year.first,
                      onSelected: (String? value) {
                        setState(() {
                          yearDropDownValue = value!;
                        });
                      },
                      dropdownMenuEntries:
                          year.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    ),
                  ),
                  const Text(
                    'Trade: ',
                    style: TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownMenu<String>(
                      initialSelection: list.first,
                      onSelected: (String? value) {
                        setState(() {
                          dropDownValue = value!;
                        });
                      },
                      dropdownMenuEntries:
                          list.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const AddStudentForm());
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 11, 16, 11),
                      decoration: BoxDecoration(
                        color: const Color(0xff5473FF),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            'Add Student ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Icons.add_rounded,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          //students list container
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text('Reg No',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                        Expanded(
                            child: Text('Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                        Expanded(
                            child: Text('Trade',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                        Expanded(
                            child: Text('',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: studentsData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(studentsData[index]['rollno']),
                              ),
                              Expanded(
                                child: Text(studentsData[index]['name']),
                              ),
                              Expanded(
                                child: Text(studentsData[index]['course']),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(left: 50),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                          onTap: () {},
                                          child: const Icon(Icons.edit)),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              16, 11, 16, 11),
                                          decoration: BoxDecoration(
                                            color: const Color(0xff5473FF),
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                          child: const Text(
                                            'Delete',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          //students list container ending
        ],
      ),
    );
  }
}
