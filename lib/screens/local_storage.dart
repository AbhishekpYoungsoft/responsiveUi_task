import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStoragePage extends StatefulWidget {
  const LocalStoragePage({super.key});

  @override
  State<LocalStoragePage> createState() => _LocalStoragePageState();
}

class _LocalStoragePageState extends State<LocalStoragePage> {
  @override
  void initState() {
    load();
  }

  @override
  void load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      list = prefs.getStringList('items')!;
    });
  }

  List<String> list = [];

  String value = '';
  int deleteIndex = -1;
  @override
  Addtask() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      list.add(value);
      print(list);
    });
    await prefs.setStringList('items', list);
  }

  @override
  Deletetask() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      list.removeAt(deleteIndex);
      print(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              "TO DO",
            ),
            centerTitle: true,
          )),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(5)),
            margin: EdgeInsets.only(left: 40.w),
            height: 50.h,
            width: 250.h,
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Add task here",
              ),
              onChanged: (text) {
                value = text;
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            //decoration: BoxDecoration(border: Border.all(),),
            margin: EdgeInsets.only(left: 40.w),
            height: 50.h,
            width: 250.h,
            child: ElevatedButton(
              onPressed: (() {
                Addtask();
              }),
              child: const Text("Add To Task"),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                for (var i = 0; i < list.length; i++) ...[
                  Container(
                      height: 40.h,
                      width: 250.h,
                      margin: EdgeInsets.only(top: 10, left: 40),
                      decoration: BoxDecoration(border: Border.all()),
                      //margin: EdgeInsets.only(top: 5.h),
                      child: ListTile(
                        trailing: IconButton(
                          onPressed: () {
                            deleteIndex = i;
                            Deletetask();
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                        title: Text(list[i]),
                      ))
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
