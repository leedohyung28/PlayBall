import 'package:flutter/material.dart';
import 'package:flutter_application_1/Headers/ResponsiveAppBar.dart';
import 'package:flutter_application_1/Headers/ResponsiveDrawer.dart';

class history2020s extends StatefulWidget {
  const history2020s({super.key});

  @override
  State<history2020s> createState() => _history2020sState();
}

class _history2020sState extends State<history2020s> {
  final List<Map<String, dynamic>> historyData = [
    {
      'team': '2023년 한국시리즈 우승팀\n LG 트윈스',
      'score': '86승 2무 56패 (승률 0.606) 정규 시즌 1위',
      'logo': 'assets/KSLogo/2023.jpg',
      'bgPic': 'assets/KSBG/2023.jpg',
      'mvpPic': 'assets/KSmvp/2023.jpg',
      'mvp': '오지환',
      'stats': '타율: 0.316, 3홈런 8타점 6득점'
    },
    {
      'team': '2022년 한국시리즈 우승팀\n SSG 랜더스',
      'score': '88승 4무 52패 (승률 0.629) 정규 시즌 1위',
      'logo': 'assets/KSLogo/2022.jpg',
      'bgPic': 'assets/KSBG/2022.jpg',
      'mvpPic': 'assets/KSmvp/2022.jpg',
      'mvp': '김강민',
      'stats': '타율: 0.375, 2홈런 5타점 3득점'
    },
    {
      'team': '2021년 한국시리즈 우승팀\n KT 위즈',
      'score': '76승 9무 59패 (승률 0.563) 정규 시즌 1위',
      'logo': 'assets/KSLogo/2021.jpg',
      'bgPic': 'assets/KSBG/2021.jpg',
      'mvpPic': 'assets/KSmvp/2021.jpg',
      'mvp': '박경수',
      'stats': '타율: 0.250, 1홈런 1타점 2득점'
    },
  ];

  int hoverIndex = -1;

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50.0), // 여기에 원하는 높이를 설정하세요
        child: ResponsiveAppBar(), // AppBar를 사용하는 대신 원하는 위젯을 이곳에 배치하세요
      ),
      drawer: isDesktop ? null : const ResponsiveDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
              'assets/historyPic/2020.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
          ),
        ),
        child: ListView.builder(
            itemCount: historyData.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  width * 0.04,
                  0,
                  width * 0.04,
                  0,
                ),
                child: MouseRegion(
                  onEnter: (_) => setState(() => hoverIndex = index),
                  onExit: (_) => setState(() => hoverIndex = -1),
                  child: Stack(
                    children: [
                      Container(
                        height: width * 0.3,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              historyData[index]['bgPic'] as String,
                            ),
                            fit: BoxFit.cover,
                            colorFilter: hoverIndex != index
                                ? ColorFilter.mode(Colors.white.withOpacity(0),
                                    BlendMode.dstATop)
                                : ColorFilter.mode(
                                    Colors.white.withOpacity(0.5),
                                    BlendMode.dstATop),
                          ),
                        ),
                        child: Transform.scale(
                          scale: 1.0,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: hoverIndex != index
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: width * 0.2,
                                          child: Image.asset(
                                            historyData[index]['logo']
                                                as String,
                                            fit: BoxFit.fitHeight,
                                            width: width * 0.2,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              historyData[index]['team'],
                                              style: TextStyle(
                                                fontSize: width * 0.03,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              height: width * 0.03,
                                            ),
                                            Text(
                                              historyData[index]['score'],
                                              style: TextStyle(
                                                fontSize: width * 0.025,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: width * 0.2,
                                          child: Image.asset(
                                            historyData[index]['mvpPic']
                                                as String,
                                            fit: BoxFit.fitHeight,
                                            height: width * 0.2,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '한국시리즈 MVP',
                                              style: TextStyle(
                                                fontSize: width * 0.025,
                                              ),
                                            ),
                                            Text(
                                              historyData[index]['mvp'],
                                              style: TextStyle(
                                                fontSize: width * 0.03,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              historyData[index]['stats'],
                                              style: TextStyle(
                                                fontSize: width * 0.025,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
