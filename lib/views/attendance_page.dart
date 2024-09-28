import 'package:flutter/material.dart';
import 'package:iti_admin_mod/models/db.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> list = <String>[
    'All',
    'Course 1',
    'Course 2',
    'Course 3',
    'Course 4'
  ];
  List<String> year = <String>[
    '2022',
    '2023',
    '2024',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                'Attendance',
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
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 11, 16, 11),
                      decoration: BoxDecoration(
                        color: const Color(0xff5473FF),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Text(
                        'Accept Requests',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
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
          //headers row ending
          //tabbar section
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Daily'),
              Tab(text: 'Monthly'),
              Tab(text: 'Date Wise'),
            ],
            dividerColor: Colors.transparent,
          ),
          //tabbar section ending
          //tabbar view section
          Expanded(
            child: TabBarView(controller: _tabController, children: const [
              DailyViewReport(),
              MonthlyViewReport(),
              DateWiseViewReport(),
            ]),
          ),
          //tabbar view ending
        ],
      ),
    );
  }
}

//section for viewing attendance daily
class DailyViewReport extends StatefulWidget {
  const DailyViewReport({super.key});

  @override
  State<DailyViewReport> createState() => _DailyViewReportState();
}

class _DailyViewReportState extends State<DailyViewReport> {
  bool foreNoon = true;
  @override
  Widget build(BuildContext context) {
    return //students list container
        Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 11, 16, 11),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: const Text(
                    'Date: 12-03-2001',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    foreNoon = true;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 11, 20, 11),
                  decoration: BoxDecoration(
                    color:
                        foreNoon ? const Color(0xff5473FF) : Colors.transparent,
                    borderRadius: BorderRadius.circular(14),
                    border: foreNoon
                        ? Border.all(color: Colors.transparent, width: 2)
                        : Border.all(color: const Color(0xff5473FF), width: 2),
                  ),
                  child: Text(
                    'FN',
                    style: TextStyle(
                      color: foreNoon ? Colors.white : const Color(0xff5473FF),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    foreNoon = false;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                    color:
                        foreNoon ? Colors.transparent : const Color(0xff5473FF),
                    borderRadius: BorderRadius.circular(14),
                    border: foreNoon
                        ? Border.all(color: const Color(0xff5473FF), width: 2)
                        : Border.all(color: Colors.transparent, width: 2),
                  ),
                  child: Text(
                    'AN',
                    style: TextStyle(
                      color: foreNoon ? const Color(0xff5473FF) : Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
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
                                  fontWeight: FontWeight.bold, fontSize: 16))),
                      Expanded(
                          child: Text('Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16))),
                      Expanded(
                          child: Text('Trade',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16))),
                      Expanded(
                          child: Text('',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16))),
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
                              child: Text('MSC00$index'),
                            ),
                            Expanded(
                              child: Text('Name$index'),
                            ),
                            Expanded(
                              child: Text('Trade$index'),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  children: [
                                    //forenoon
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xff389720)),
                                            child: const Center(
                                              child: Text(
                                                'P',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          'FN',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff4C4949)),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    //afternoon
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffE51717)),
                                            child: const Center(
                                              child: Text(
                                                'A',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          'AN',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff4C4949)),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 50),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                              onTap: () {},
                                              child: const Icon(Icons.edit)),
                                        ],
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
      ],
    );
    //students list container ending
  }
}

//section for viewing attendance report monthly wise
class MonthlyViewReport extends StatelessWidget {
  const MonthlyViewReport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 11, 16, 11),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: const Text(
                    'Year: 2024',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 11, 16, 11),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: const Text(
                    'Month: January',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.save_alt_rounded,
                size: 30.0,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.grey[300],
          child: const Row(
            children: [
              Expanded(
                  child: Text('No',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  child: Text('Name',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  child: Text('Present',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  child: Text('Total',
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
                child: const Row(
                  children: [
                    Expanded(
                      child: Text('No'),
                    ),
                    Expanded(
                      child: Text('Name'),
                    ),
                    Expanded(
                      child: Text('Present'),
                    ),
                    Expanded(
                      child: Text('Total'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

//section for viewing attendance report date wise
class DateWiseViewReport extends StatelessWidget {
  const DateWiseViewReport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 11, 16, 11),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: const Text(
                    '10-10-2024',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 11, 16, 11),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: const Text(
                    '10-11-2024',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.save_alt_rounded,
                size: 30.0,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.grey[300],
          child: const Row(
            children: [
              Expanded(
                  child: Text('No',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  child: Text('Name',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  child: Text('Present',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  child: Text('Total',
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
                child: const Row(
                  children: [
                    Expanded(
                      child: Text('No'),
                    ),
                    Expanded(
                      child: Text('Name'),
                    ),
                    Expanded(
                      child: Text('Present'),
                    ),
                    Expanded(
                      child: Text('Total'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
