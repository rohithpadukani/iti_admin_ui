import 'package:flutter/material.dart';
import 'package:iti_admin_mod/models/db.dart';

class StipendPage extends StatefulWidget {
  const StipendPage({super.key});

  @override
  State<StipendPage> createState() => _StipendPageState();
}

class _StipendPageState extends State<StipendPage> {
  List<String> trade = <String>['Fitter','Plumber', 'Wireman'];
  List<String> month = <String>['Jan', 'Feb', 'March', 'April', 'May'];
  List<String> caste = <String>['SE', 'ST', 'General',];
  List<String> year = <String>['2022', '2023', '2024',];
  @override
  Widget build(BuildContext context) {
    String tradeDropDownValue = trade.first;
    String monthDropDownValue = month.first;
    String casteDropDownValue = caste.first;
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
                    'Month: ',
                    style: TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownMenu<String>(
                      initialSelection: month.first,
                      onSelected: (String? value) {
                        setState(() {
                          monthDropDownValue = value!;
                        });
                      },
                      dropdownMenuEntries:
                          month.map<DropdownMenuEntry<String>>((String value) {
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
                      initialSelection: trade.first,
                      onSelected: (String? value) {
                        setState(() {
                          tradeDropDownValue = value!;
                        });
                      },
                      dropdownMenuEntries:
                          trade.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    ),
                  ),
                  const Text(
                    'Caste: ',
                    style: TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownMenu<String>(
                      initialSelection: caste.first,
                      onSelected: (String? value) {
                        setState(() {
                          casteDropDownValue = value!;
                        });
                      },
                      dropdownMenuEntries:
                          caste.map<DropdownMenuEntry<String>>((String value) {
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
                      child: const Text(
                        'Export',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
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
                            child: Text('Amount',
                                style: TextStyle(fontWeight: FontWeight.bold))),
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
                                child: Text(stipendData[index]['name']),
                              ),
                              Expanded(
                                child: Text(studentsData[index]['course']),
                              ),
                              Expanded(
                                child: Text(stipendData[index]['amount'].toString()),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(left: 50),
                                  child: GestureDetector(
                                      onTap: () {},
                                      child: const Icon(Icons.edit)),
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