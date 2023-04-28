import 'package:flutter/material.dart';
import 'package:screenutilapp/new/nav_drawer.dart';
import 'package:screenutilapp/screens/home_screen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<PopupMenuEntry<String>> _menuItems = [
    PopupMenuItem<String>(
      value: 'Account',
      child: ListTile(
        leading: Icon(Icons.manage_accounts_outlined),
        title: Text('User Name'),
        subtitle: Text('example@example.com'),
      ),
    ),

    PopupMenuItem<String>(
      value: 'Account',
      child: ListTile(
        leading: Icon(Icons.account_box),
        title: Text('Account'),
        //subtitle: Text('example@example.com'),
      ),
    ),
    PopupMenuItem<String>(
      value: 'Settings',
      child: ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
        //subtitle: Text('example@example.com'),
      ),
    ),
    PopupMenuItem<String>(
      value: 'Language',
      child: ListTile(
        leading: Icon(Icons.language),
        title: Text('Language'),
        //subtitle: Text('example@example.com'),
      ),
    ),
    PopupMenuItem<String>(
      value: 'Logout',
      child: ListTile(
        leading: Icon(Icons.logout),
        title: Text(' Logout'),
        //subtitle: Text('example@example.com'),
      ),
    ),

    // PopupMenuItem<String>(
    //   value: 'option2',
    //   child: Text('Option 2'),
    // ),
    // PopupMenuDivider(),
    // PopupMenuItem<String>(
    //   value: 'option3',
    //   child: Text('Option 3'),
    // ),
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
    return Scaffold(
      drawer: NavDrawer(selected: DrawerSelection.home),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashboard"),
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
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            color: Colors.amber.shade50,
            child: const Text(
                "Welcome to dashboard, if you have any queries visit here"),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Activity",
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 20,
          ),

          Text("All activity"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text("name"), Text("Filter name"), Text("date")],
          ) //a here shoulf be converted to a button
        ],
      ),
    );
  }
}
