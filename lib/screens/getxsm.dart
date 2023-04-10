import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:screenutilapp/controllers/counter_controllers.dart';

class CounterPgae extends StatefulWidget {
  CounterPgae({super.key});

  void IncrementCounter(int counter) {}

  @override
  State<CounterPgae> createState() => _CounterPgaeState();
}

class _CounterPgaeState extends State<CounterPgae> {
  // int counter = 0;
  final CounterController counterController =
      Get.put(CounterController()); //dependenccy injection
  @override
  void IncremnetCounter() {
    //removed
    // setState(() {
    //   counter++;
    //   print(counter);
    // });
  }

  @override
  Widget build(BuildContext context) {
    print("WHOLE WIDGET REBUILT FROM SCAFFOLD");
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.square(80.h),
          child: AppBar(
              title: Text("\nCounter "),
              centerTitle: true,
              automaticallyImplyLeading: false),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx((() {
                // print("Only Text Widget rebuild");
                return Text(
                  counterController.getCounter
                      .toString(), //changed to getx class counter
                  style: TextStyle(color: Colors.black, fontSize: 24.sp),
                );
              }))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              counterController.IncrementCounter(); //IncremnetCounter,
            },
            child: Icon(Icons.add)),
      ),
    );
  }
}
