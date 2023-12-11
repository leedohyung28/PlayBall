import 'package:flutter/material.dart';
import 'package:flutter_application_1/Headers/ResponsiveAppBar.dart';
import 'package:flutter_application_1/Headers/ResponsiveDrawer.dart';
import 'package:flutter_application_1/Screens/Eras/1980s.dart';
import 'package:flutter_application_1/Screens/Eras/1990s.dart';
import 'package:flutter_application_1/Screens/Eras/2000s.dart';
import 'package:flutter_application_1/Screens/Eras/2010s.dart';
import 'package:flutter_application_1/Screens/Eras/2020s.dart';
import 'package:stroke_text/stroke_text.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final List<Map<String, dynamic>> historyYears = [
    {
      'hText': '1980년대',
      'hPic': 'assets/historyPic/1980.jpg',
      'tap': const history1980s(),
    },
    {
      'hText': '1990년대',
      'hPic': 'assets/historyPic/1990.jpg',
      'tap': const history1990s(),
    },
    {
      'hText': '2000년대',
      'hPic': 'assets/historyPic/2000.jpg',
      'tap': const history2000s(),
    },
    {
      'hText': '2010년대',
      'hPic': 'assets/historyPic/2010.jpg',
      'tap': const history2010s(),
    },
    {
      'hText': '2020년대',
      'hPic': 'assets/historyPic/2020.jpg',
      'tap': const history2020s(),
    },
  ];

  int hoverIndex = -1;

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    var width = MediaQuery.of(context).size.width;

    int crossAxisCount;
    if (width < 600) {
      crossAxisCount = 1;
    } else if (width < 900) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 3;
    }

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: ResponsiveAppBar(),
      ),
      drawer: isDesktop ? null : const ResponsiveDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/teamBackground.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.builder(
          itemCount: 5,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return MouseRegion(
              onEnter: (_) => setState(() => hoverIndex = index),
              onExit: (_) => setState(() => hoverIndex = -1),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => historyYears[index]['tap'],
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        historyYears[index]['hPic'] as String,
                      ),
                      fit: BoxFit.cover,
                      colorFilter: hoverIndex != index
                          ? ColorFilter.mode(
                              Colors.white.withOpacity(0.4), BlendMode.dstATop)
                          : ColorFilter.mode(
                              Colors.white.withOpacity(0.7), BlendMode.dstATop),
                    ),
                  ),
                  child: Center(
                    child: StrokeText(
                      text: historyYears[index]['hText'] as String,
                      textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      strokeColor: Colors.black,
                      strokeWidth: 5,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
