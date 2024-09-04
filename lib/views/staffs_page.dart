import 'package:flutter/material.dart';

class StaffsPage extends StatefulWidget {
  const StaffsPage({super.key});

  @override
  State<StaffsPage> createState() => _StaffsPageState();
}

class _StaffsPageState extends State<StaffsPage> {
  List<String> list = <String>['Course 1', 'Course 2', 'Course 3', 'Course 4'];
  @override
  Widget build(BuildContext context) {
    String dropDownValue = list.first;
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
                'Staffs',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
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
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 11, 16, 11),
                      decoration: BoxDecoration(
                        color: const Color(0xff5473FF),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            'Add Staff ',
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
                            child: Text('Staff Id',
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
                            child: Text('Username',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                        Expanded(
                            child: Text('Password',
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
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text('STF$index'),
                              ),
                              Expanded(
                                child: Text('Name$index'),
                              ),
                              Expanded(
                                child: Text('Trade$index'),
                              ),
                              Expanded(
                                child: Text('Username$index'),
                              ),
                              const Expanded(
                                child: Text('********'),
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
          )
        ],
      ),
    );
  }
}
