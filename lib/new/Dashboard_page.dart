import 'package:flutter/material.dart';
import 'package:screenutilapp/new/config/app_colors.dart';
import 'package:screenutilapp/new/nav_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoard extends StatefulWidget {
  DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool allActivity = true;
  List<String> _names = ['John', 'Mary', 'David', 'Jane', 'Alex', 'Sarah'];
  List<String> dates = [
    '1-1-2023 to 1-2-2023',
    '2-1-2023 to 3-2-2023'
        '1-1-2023 to 4-2-2023'
        '4-1-2023 to 5-2-2023'
        '5-1-2023 to 6-2-2023'
        '6-1-2023 to 7-2-2023'
  ];
  bool _isAscending = true;
  String _searchQuery = '';
  //appcolors
  AppColor appColor = AppColor();

//popup menu button elements
  final List<PopupMenuEntry<String>> _menuItems = [
    const PopupMenuItem<String>(
      value: 'Account',
      child: ListTile(
        leading: Icon(Icons.manage_accounts_outlined),
        title: Text('User Name'),
        subtitle: Text('example@example.com'),
      ),
    ),
    const PopupMenuItem<String>(
      value: 'Account',
      child: ListTile(
        leading: Icon(Icons.account_box),
        title: Text('Account'),
        //subtitle: Text('example@example.com'),
      ),
    ),
    const PopupMenuItem<String>(
      value: 'Settings',
      child: ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
        //subtitle: Text('example@example.com'),
      ),
    ),
    const PopupMenuItem<String>(
      value: 'Language',
      child: ListTile(
        leading: Icon(Icons.language),
        title: Text('Language'),
        //subtitle: Text('example@example.com'),
      ),
    ),
    const PopupMenuItem<String>(
      value: 'Logout',
      child: ListTile(
        leading: Icon(Icons.logout),
        title: Text(' Logout'),
        //subtitle: Text('example@example.com'),
      ),
    ),
  ];

  //-----------------------------------------------------
  void _handleMenuItemSelected(String value) {
    switch (value) {
      case 'Account':
        print("Account selected");
        //navi
        break;
      case 'Settings':
        print(" Settings selected");
        break;
      case 'Language':
        print(" Language selected");
        break;
      case 'Logout':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    //seacrh and filter function
    List<String> filteredNames =
        _names.where((name) => name.contains(_searchQuery)).toList();
    filteredNames
        .sort((a, b) => _isAscending ? a.compareTo(b) : b.compareTo(a));

    return Scaffold(
      drawer: NavDrawer(selected: DrawerSelection.home),
      appBar: AppBar(
        backgroundColor: appColor.whiteColor,
        //centerTitle: true,
        iconTheme: IconThemeData(
          color: appColor.blackColor,
        ),
        title: Text(
          "Uber for business",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
              color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help),
            tooltip: "Help",
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            //tooltip: "Help",
          ),
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => _menuItems,
            onSelected: _handleMenuItemSelected,
            icon: const Icon(Icons.account_circle),
            //shape:
          ),
        ],
      ),
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 30.h,
              child: Padding(
                padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                child: Card(
                  color: Colors.amber.shade50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome to dashboard, if you have any queries visit ",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      GestureDetector(
                          child: Text("here"),
                          onTap: () {
                            //navigate to more details page
                            print("navigating to more details page");
                          })
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Activity",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    "All activity",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  onPressed: () {
                    //below container setup,for 2 different types of data
                    allActivity = true;

                    setState(() {
                      print("all activity status  ${allActivity}");
                    });
                  },
                ),
                SizedBox(
                  width: 5.w,
                ),
                TextButton(
                  child: Text(
                    "Reviewed Activity",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  onPressed: () {
                    allActivity = false;
                    setState(() {
                      print("all activity status  ${allActivity}");
                    });
                    //below container setup changed
                  },
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Divider(
              thickness: 10.sp,
            ),
            //------------------------------------Need to change here as it is not working inside a Row body
            Padding(
              padding: EdgeInsets.all(5.sp),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Filter by name',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
            //the body
            allActivity
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //name and assending option row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Name',
                                  textAlign: TextAlign.start,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              IconButton(
                                icon: Icon(_isAscending
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward),
                                onPressed: () {
                                  setState(() {
                                    _isAscending =
                                        !_isAscending; // for asending and descending feature
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: appColor.greyColor10,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                width: 45.w,
                                height: 25.h,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 5.sp, left: 5.sp),
                                  child: const Text("Filter by name",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: appColor.greyColor10,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                width: 45.w,
                                height: 25.h,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 5.sp, left: 5.sp),
                                  child: const Text("1-1-2023 to 1-2-2023",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //name and assending option row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Name',
                                  textAlign: TextAlign.start,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              IconButton(
                                icon: Icon(_isAscending
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward),
                                onPressed: () {
                                  setState(() {
                                    _isAscending =
                                        !_isAscending; // for asending and descending feature
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: appColor.greyColor10,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                width: 45.w,
                                height: 25.h,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 5.sp, left: 5.sp),
                                  child: const Text("Filter by name",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: appColor.greyColor10,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                width: 45.w,
                                height: 25.h,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 5.sp, left: 5.sp),
                                  child: const Text("2-1-2023 to 3-2-2023",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
          ]),
    );
  }
}
