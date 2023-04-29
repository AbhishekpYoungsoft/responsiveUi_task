import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum DrawerSelection {
  home,
  User,
  Owner,
  Pilot,
  Car_Dashboard,
  Reservations,
  Notifications,
  Chat_Support,
  Payments
}

class NavDrawer extends StatefulWidget {
  final DrawerSelection selected;
  const NavDrawer({super.key, required this.selected});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        SizedBox(
          height: 100.h,
          child: DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(),
                  borderRadius: BorderRadius.circular(2)),
              child: Center(
                child: Text(
                  "Home",
                  style: TextStyle(fontSize: 24.sp),
                ),
              )),
        ),
        Center(
          child: Text(
            "Add & Manage",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Divider(),
        ListTile(
          selected: widget.selected == DrawerSelection.home,
          leading: const Icon(Icons.car_repair),
          title: const Text("Car"),
          onTap: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => NewHomeScreen()));
          },
        ),
        ListTile(
          selected: widget.selected == DrawerSelection.User,
          leading: Icon(Icons.man_outlined),
          title: Text("User"),
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => MemeCreatorPage(
            //           selectedImageUrl: defaultImageUrl,
            //         )));
          },
        ),
        ListTile(
          selected: widget.selected == DrawerSelection.Owner,
          leading: Icon(Icons.man_sharp),
          title: Text("Owner"),
          onTap: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => AboutPage()));
          },
        ),
        ListTile(
          selected: widget.selected == DrawerSelection.Pilot,
          leading: const Icon(Icons.drive_eta),
          title: const Text("Pilot"),
          onTap: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => NewHomeScreen()));
          },
        ),
        SizedBox(
          height: 20,
        ),
        ListTile(
          selected: widget.selected == DrawerSelection.Car_Dashboard,
          leading: const Icon(Icons.car_rental),
          title: const Text("Car Dashboard"),
          onTap: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => NewHomeScreen()));
          },
        ),
        ListTile(
          selected: widget.selected == DrawerSelection.Reservations,
          leading: const Icon(Icons.book_sharp),
          title: const Text("Reservations"),
          onTap: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => NewHomeScreen()));
          },
        ),
        ListTile(
          selected: widget.selected == DrawerSelection.Notifications,
          leading: const Icon(Icons.notifications),
          title: const Text("Notificatons"),
          onTap: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => NewHomeScreen()));
          },
        ),
        ListTile(
          selected: widget.selected == DrawerSelection.Chat_Support,
          leading: const Icon(Icons.chat),
          title: const Text("Chat Support"),
          onTap: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => NewHomeScreen()));
          },
        ),
        ListTile(
          selected: widget.selected == DrawerSelection.Payments,
          leading: const Icon(Icons.payment),
          title: const Text("Payments"),
          onTap: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => NewHomeScreen()));
          },
        ),
      ]),
    );
  }
}
