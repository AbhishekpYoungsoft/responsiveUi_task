import 'package:flutter/material.dart';

enum DrawerSelection { home, creator, about }

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
          height: 112,
          child: DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  // border: Border.all(),
                  borderRadius: BorderRadius.circular(2)),
              child: const Center(
                child: Text("Dashboard"),
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
          selected: widget.selected == DrawerSelection.creator,
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
          selected: widget.selected == DrawerSelection.about,
          leading: Icon(Icons.man_sharp),
          title: Text("Owner"),
          onTap: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => AboutPage()));
          },
        ),
        ListTile(
          selected: widget.selected == DrawerSelection.home,
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
          selected: widget.selected == DrawerSelection.home,
          leading: const Icon(Icons.car_rental),
          title: const Text("Car Dashboard"),
          onTap: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => NewHomeScreen()));
          },
        ),
        ListTile(
          selected: widget.selected == DrawerSelection.home,
          leading: const Icon(Icons.book_sharp),
          title: const Text("Reservations"),
          onTap: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => NewHomeScreen()));
          },
        ),
        ListTile(
          selected: widget.selected == DrawerSelection.home,
          leading: const Icon(Icons.notifications),
          title: const Text("Notificatons"),
          onTap: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => NewHomeScreen()));
          },
        ),
        ListTile(
          selected: widget.selected == DrawerSelection.home,
          leading: const Icon(Icons.chat),
          title: const Text("Chat Support"),
          onTap: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => NewHomeScreen()));
          },
        ),
        ListTile(
          selected: widget.selected == DrawerSelection.home,
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
