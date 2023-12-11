import 'package:flutter/material.dart';
import 'package:flutter_application_1/Headers/ResponsiveAppBar.dart';
import 'package:flutter_application_1/Headers/ResponsiveDrawer.dart';

class history2010s extends StatefulWidget {
  const history2010s({super.key});

  @override
  State<history2010s> createState() => _history2010sState();
}

class _history2010sState extends State<history2010s> {
  final List<Map<String, dynamic>> historyData = [
    {
      'team': '2019년 한국시리즈 우승팀\n 두산 베어스',
      'score': '88승 1무 55패 (승률 0.615) 정규 시즌 1위',
      'logo': 'assets/KSLogo/2019.jpg',
      'bgPic': 'assets/KSBG/2019.jpg',
      'mvpPic': 'assets/KSmvp/2019.jpg',
      'mvp': '오재일',
      'stats': '타율: 0.333, 1홈런 6타점 4득점'
    },
    {
      'team': '2018년 한국시리즈 우승팀\n SK 와이번스',
      'logo': 'assets/KSLogo/2018.jpg',
      'bgPic': 'assets/KSBG/2018.jpg',
      'mvpPic': 'assets/KSmvp/2018.jpg',
      'score': '78승 1무 65패 (승률 0.545) 정규 시즌 1위',
      'mvp': '한동민',
      'stats': '타율: 0.190, 2홈런 4타점 4득점'
    },
    {
      'team': '2017년 한국시리즈 우승팀\n KIA 타이거즈',
      'logo': 'assets/KSLogo/2017.jpg',
      'bgPic': 'assets/KSBG/2017.jpg',
      'mvpPic': 'assets/KSmvp/2017.jpg',
      'score': '87승 1무 56패 (승률 0.608) 정규 시즌 1위',
      'mvp': '양현종',
      'stats': '방어율: 0, 1승, 1세이브, 10이닝'
    },
    {
      'team': '2016년 한국시리즈 우승팀\n 두산 베어스',
      'logo': 'assets/KSLogo/2016.jpg',
      'bgPic': 'assets/KSBG/2016.jpg',
      'mvpPic': 'assets/KSmvp/2016.jpg',
      'score': '93승 1무 50패 (승률 0.650) 정규 시즌 1위',
      'mvp': '양의지',
      'stats': '타율: 0.438, 1홈런 4타점 4득점'
    },
    {
      'team': '2015년 한국시리즈 우승팀\n 두산 베어스',
      'logo': 'assets/KSLogo/2015.jpg',
      'bgPic': 'assets/KSBG/2015.jpg',
      'mvpPic': 'assets/KSmvp/2015.jpg',
      'score': '79승 0무 65패 (승률 0.549) 정규 시즌 1위',
      'mvp': '정수빈',
      'stats': '타율: 0.571, 1홈런 5타점 6득점'
    },
    {
      'team': '2014년 한국시리즈 우승팀\n 삼성 라이온즈',
      'logo': 'assets/KSLogo/2014.jpg',
      'bgPic': 'assets/KSBG/2014.jpg',
      'mvpPic': 'assets/KSmvp/2014.jpg',
      'score': '78승 3무 47패 (승률 0.624) 정규 시즌 1위',
      'mvp': '나바로',
      'stats': '타율: 0.333, 4홈런 10타점 8득점'
    },
    {
      'team': '2013년 한국시리즈 우승팀\n 삼성 라이온즈',
      'logo': 'assets/KSLogo/2013.jpg',
      'bgPic': 'assets/KSBG/2013.jpg',
      'mvpPic': 'assets/KSmvp/2013.jpg',
      'score': '75승 2무 51패 (승률 0.595) 정규 시즌 1위',
      'mvp': '박한이',
      'stats': '타율: 0.292, 1홈런 6타점 6득점'
    },
    {
      'team': '2012년 한국시리즈 우승팀\n 삼성 라이온즈',
      'logo': 'assets/KSLogo/2012.jpg',
      'bgPic': 'assets/KSBG/2012.jpg',
      'mvpPic': 'assets/KSmvp/2012.jpg',
      'score': '80승 2무 51패 (승률 0.611) 정규 시즌 1위',
      'mvp': '이승엽',
      'stats': '타율: 0.348, 1홈런 7타점 4득점'
    },
    {
      'team': '2011년 한국시리즈 우승팀\n 삼성 라이온즈',
      'logo': 'assets/KSLogo/2011.jpg',
      'bgPic': 'assets/KSBG/2011.jpg',
      'mvpPic': 'assets/KSmvp/2011.jpg',
      'score': '79승 4무 50패 (승률 0.612) 정규 시즌 1위',
      'mvp': '오승환',
      'stats': '방어율: 0, 4경기 3세이브'
    },
    {
      'team': '2010년 한국시리즈 우승팀\n SK 와이번스',
      'logo': 'assets/KSLogo/2010.jpg',
      'bgPic': 'assets/KSBG/2010.jpg',
      'mvpPic': 'assets/KSmvp/2010.jpg',
      'score': '84승 2무 47패 (승률 0.632) 정규 시즌 1위',
      'mvp': '박정권',
      'stats': '타율: 0.357, 1홈런 6타점 3득점'
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
              'assets/historyPic/2010.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.5), BlendMode.dstATop),
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
