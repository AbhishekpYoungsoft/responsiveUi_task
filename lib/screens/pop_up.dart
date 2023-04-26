import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PopUpTypes extends StatefulWidget {
  const PopUpTypes({super.key});

  @override
  State<PopUpTypes> createState() => _PopUpTypesState();
}

class _PopUpTypesState extends State<PopUpTypes> {
  _showDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          icon: Icon(Icons.notification_add_sharp),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is an example of an alert dialog.'),
                Text('Would you like to see a bottomsheet example?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                // Do something when the user presses the Yes button
                //Navigator.of(context).pop();
                _showBottomSheet();
                //Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('No'),
              onPressed: () {
                // Do something when the user presses the No button
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //------------------------------------------bottom sheet list
  List<PopupMenuEntry<String>> _menuItems = [
    PopupMenuItem<String>(
      value: 'option1',
      child: Text('Option 1'),
    ),
    PopupMenuItem<String>(
      value: 'option2',
      child: Text('Option 2'),
    ),
    PopupMenuDivider(),
    PopupMenuItem<String>(
      value: 'option3',
      child: Text('Option 3'),
    ),
  ];

  //--------------------------------------------BottomSheet function
  void _handleMenuItemSelected(String value) {
    switch (value) {
      case 'option1':
        print("ption 1 selected");
        break;
      case 'option2':
        print("option 2 selected");
        break;
      case 'option3':
        break;
    }
  }

  void _showBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Other pop ups',
              ),
              SizedBox(height: 16.h),
              ListTile(
                  leading: const Icon(Icons.message_outlined),
                  title: const Text('Toast Message'),
                  onTap: (() => Fluttertoast.showToast(msg: "hi"))
                  //need to call a toast message function here
                  //_getToastMessage();

                  ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Other'),
                onTap: () {
                  // Do something when the user taps on this option
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  _getToastMessage() {
    Fluttertoast.showToast(msg: "This is toast message, have a good day");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("POP UPS"),
        toolbarHeight: 100.h,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Show Alert'),
              onPressed: () {
                _showDialog();
              },
            ),
            PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => _menuItems,
              onSelected: _handleMenuItemSelected,
            ),
            ElevatedButton(
                onPressed: () {
                  Fluttertoast.showToast(msg: "hi");
                },
                child: Text("Toast"))
          ],
        ),
      ),
    );
  }
}
