import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/History.dart';
import 'package:flutter_application_1/Screens/Teams.dart';
import 'package:flutter_application_1/Screens/Ticketing.dart';
import 'package:flutter_application_1/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ResponsiveAppBar extends StatelessWidget {
  const ResponsiveAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    return AppBar(
      backgroundColor: Colors.black,
      title: isDesktop
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  icon: const FaIcon(FontAwesomeIcons.baseball),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Teams(),
                      ),
                    );
                  },
                  child: const Text(
                    "구단",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const History(),
                      ),
                    );
                  },
                  child: const Text(
                    "역대 우승",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Ticketing(),
                      ),
                    );
                  },
                  child: const Text(
                    "예매",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    launchUrl(Uri.parse(
                        'https://sports.news.naver.com/kbaseball/news/index?isphoto=N'));
                  },
                  child: const Text(
                    "뉴스",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 0,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  icon: const FaIcon(FontAwesomeIcons.baseball),
                ),
                IconButton(
                  onPressed: () {
                    launchUrl(Uri.parse(
                        'https://sports.news.naver.com/kbaseball/news/index?isphoto=N'));
                  },
                  icon: const FaIcon(FontAwesomeIcons.solidNewspaper),
                ),
              ],
            ),
    );
  }
}
