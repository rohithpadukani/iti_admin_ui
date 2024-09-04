import 'package:flutter/material.dart';

class HolidaysPage extends StatefulWidget {
  const HolidaysPage({super.key});

  @override
  State<HolidaysPage> createState() => _HolidaysPageState();
}

class _HolidaysPageState extends State<HolidaysPage> {
  @override
  Widget build(BuildContext context) {
    //String dropDownValue = list.first;
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
                'Holidays',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 11, 16, 11),
                  decoration: BoxDecoration(
                    color: const Color(0xff5473FF),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20,),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 11, 16, 11),
                  decoration: BoxDecoration(
                    color: const Color(0xff5473FF),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Text(
                    'Delete',
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
                            child: Text('Jan',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                        Expanded(
                            child: Text('Feb',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                        Expanded(
                            child: Text('Mar',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                        Expanded(
                            child: Text('Apr',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            child: Text('May',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                        Expanded(
                            child: Text('Jun',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                        Expanded(
                            child: Text('Jul',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                        Expanded(
                            child: Text('Aug',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            child: Text('Sep',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                        Expanded(
                            child: Text('Oct',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                        Expanded(
                            child: Text('Nov',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                        Expanded(
                            child: Text('Dec',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text('$index'),
                              ),
                              Expanded(
                                child: Text('$index'),
                              ),
                              Expanded(
                                child: Text('$index'),
                              ),
                              Expanded(
                                child: Text('$index'),
                              ),
                              Expanded(
                                child: Text('$index'),
                              ),
                              Expanded(
                                child: Text('$index'),
                              ),
                              Expanded(
                                child: Text('$index'),
                              ),
                              Expanded(
                                child: Text('$index'),
                              ),
                              Expanded(
                                child: Text('$index'),
                              ),
                              Expanded(
                                child: Text('$index'),
                              ),
                              Expanded(
                                child: Text('$index'),
                              ),
                              Expanded(
                                child: Text('$index'),
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
