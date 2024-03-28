import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // This selctedDates variable is used to Store the List of Selected Dates from Calender
  List<DateTime?> selctedDates = [];

// This Method/Function is Used to show Calender and allow user to select multiple dates
  void pickMultidate() async {
    var results = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        // calendarType
          calendarType: CalendarDatePicker2Type.multi,
          // Selected Date Style
          selectedDayTextStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              // Normal Date Style
          dayTextStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14),
            // From Date  
          firstDate: DateTime.now(),
           // To Date  
          lastDate: DateTime.now().add(const Duration(days: 10))),
        // Dialog Size
      dialogSize: const Size(325, 400),
      // Here we are passing list of selected dates which will be circle in calender
      value: selctedDates,
      borderRadius: BorderRadius.circular(15),
    );
    setState(() {
      // Checking if results is have value or not
      if (results != null) {
        // Assigning the list of values to our selctedDates variable
        selctedDates = results;
      }
    });
  }
// This Method convert the List of Dates into a Single String and separted with " ; "
  String listToString() {
    return selctedDates
        .map((e) => e?.toLocal().toString().substring(0, 10))
        .toList()
        .join(" ; ");
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar"),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            // Calling the date picker method
            pickMultidate();
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 10, right: 10),
            height: 35,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(3.0)),
            ),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      selctedDates.isEmpty ? "Enter" : listToString(),
                      style: TextStyle(
                          color: selctedDates.isEmpty
                              ? Colors.grey
                              : Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.date_range,
                    color: selctedDates.isEmpty ? Colors.grey : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
