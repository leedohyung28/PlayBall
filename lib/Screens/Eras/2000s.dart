import 'package:flutter/material.dart';
import 'package:flutter_application_1/Headers/ResponsiveAppBar.dart';
import 'package:flutter_application_1/Headers/ResponsiveDrawer.dart';

class history2000s extends StatefulWidget {
  const history2000s({super.key});

  @override
  State<history2000s> createState() => _history2000sState();
}

class _history2000sState extends State<history2000s> {
  final List<Map<String, dynamic>> historyData = [
    {
      'team': '2009년 한국시리즈 우승팀\n KIA 타이거즈',
      'logo': 'assets/KSLogo/2009.jpg',
      'bgPic': 'assets/KSBG/2009.jpg',
      'mvpPic': 'assets/KSmvp/2009.jpg',
      'score': '81승 4무 48패 (승률 0.609) 정규 시즌 1위',
      'mvp': '나지완',
      'stats': '타율: 0.250, 2홈런 4타점 2득점'
    },
    {
      'team': '2008년 한국시리즈 우승팀\n SK 와이번스',
      'logo': 'assets/KSLogo/2008.jpg',
      'bgPic': 'assets/KSBG/2008.jpg',
      'mvpPic': 'assets/KSmvp/2008.jpg',
      'score': '83승 0무 43패 (승률 0.659) 정규 시즌 1위',
      'mvp': '최정',
      'stats': '타율: 0.263, 1홈런 4타점 1득점'
    },
    {
      'team': '2007년 한국시리즈 우승팀\n SK 와이번스',
      'logo': 'assets/KSLogo/2007.jpg',
      'bgPic': 'assets/KSBG/2007.jpg',
      'mvpPic': 'assets/KSmvp/2007.jpg',
      'score': '73승 5무 48패 (승률 0.603) 정규 시즌 1위',
      'mvp': '김재현',
      'stats': '타율: 0.348, 2홈런 4타점 5득점'
    },
    {
      'team': '2006년 한국시리즈 우승팀\n 삼성 라이온즈',
      'logo': 'assets/KSLogo/2006.jpg',
      'bgPic': 'assets/KSBG/2006.jpg',
      'mvpPic': 'assets/KSmvp/2006.jpg',
      'score': '73승 3무 50패 (승률 0.593) 정규 시즌 1위',
      'mvp': '박진만',
      'stats': '타율: 0.273, 2타점 4득점'
    },
    {
      'team': '2005년 한국시리즈 우승팀\n 삼성 라이온즈',
      'logo': 'assets/KSLogo/2005.jpg',
      'bgPic': 'assets/KSBG/2005.jpg',
      'mvpPic': 'assets/KSmvp/2005.jpg',
      'score': '74승 4무 48패 (승률 0.607) 정규 시즌 1위',
      'mvp': '오승환',
      'stats': '방어율: 0, 1승 1세이브',
    },
    {
      'team': '2004년 한국시리즈 우승팀\n 현대 유니콘스',
      'logo': 'assets/KSLogo/2004.jpg',
      'bgPic': 'assets/KSBG/2004.jpg',
      'mvpPic': 'assets/KSmvp/2004.jpg',
      'score': '75승 5무 53패 (승률 0.586) 정규 시즌 1위',
      'mvp': '조용준',
      'stats': '방어율: 0, 7경기 3세이브'
    },
    {
      'team': '2003년 한국시리즈 우승팀\n 현대 유니콘스',
      'logo': 'assets/KSLogo/2003.jpg',
      'bgPic': 'assets/KSBG/2003.jpg',
      'mvpPic': 'assets/KSmvp/2003.jpg',
      'score': '80승 2무 51패 (승률 0.611) 정규 시즌 1위',
      'mvp': '정민태',
      'stats': '방어율: 1.69, 3경기 3승'
    },
    {
      'team': '2002년 한국시리즈 우승팀\n 삼성 라이온즈',
      'logo': 'assets/KSLogo/2002.jpg',
      'bgPic': 'assets/KSBG/2002.jpg',
      'mvpPic': 'assets/KSmvp/2002.jpg',
      'score': '82승 4무 47패 (승률 0.636) 정규 시즌 1위',
      'mvp': '마해영',
      'stats': '타율: 0.459, 3홈런 10타점'
    },
    {
      'team': '2001년 한국시리즈 우승팀\n 두산 베어스',
      'logo': 'assets/KSLogo/2001.jpg',
      'bgPic': 'assets/KSBG/2001.jpg',
      'mvpPic': 'assets/KSmvp/2001.jpg',
      'score': '65승 5무 63패 (승률 0.508) 정규 시즌 3위',
      'mvp': '우즈',
      'stats': '타율: 0.391, 4홈런 8타점 9득점'
    },
    {
      'team': '2000년 한국시리즈 우승팀\n 현대 유니콘스',
      'logo': 'assets/KSLogo/2000.jpg',
      'bgPic': 'assets/KSBG/2000.jpg',
      'mvpPic': 'assets/KSmvp/2000.jpg',
      'score': '91승 2무 40패 (승률 0.695) 드림 리그 1위',
      'mvp': '퀸란',
      'stats': '타율: 0.346, 3홈런 10타점 4득점'
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
              'assets/historyPic/2000.jpg',
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
