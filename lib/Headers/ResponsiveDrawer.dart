import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/History.dart';
import 'package:flutter_application_1/Screens/Teams.dart';
import 'package:flutter_application_1/Screens/Ticketing.dart';
import 'package:flutter_application_1/main.dart';

class ResponsiveDrawer extends StatelessWidget {
  const ResponsiveDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Center(
              child: Text(
                'Play Ball',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'UndergroundNF',
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('홈'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
                (Route<dynamic> route) => false,
              );
            },
          ),
          ListTile(
            title: const Text('구단'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Teams(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('역대우승'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const History(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('예매'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Ticketing(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
