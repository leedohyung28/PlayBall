import 'package:flutter/material.dart';
import 'package:flutter_application_1/Headers/ResponsiveAppBar.dart';
import 'package:flutter_application_1/Headers/ResponsiveDrawer.dart';

class history1990s extends StatefulWidget {
  const history1990s({super.key});

  @override
  State<history1990s> createState() => _history1990sState();
}

class _history1990sState extends State<history1990s> {
  final List<Map<String, dynamic>> historyData = [
    {
      'team': '1999년 한국시리즈 우승팀\n 한화 이글스',
      'logo': 'assets/KSLogo/1999.jpg',
      'bgPic': 'assets/KSBG/1999.jpg',
      'mvpPic': 'assets/KSmvp/1999.jpg',
      'score': '72승 2무 58패 (승률 0.695) 매직 리그 2위',
      'mvp': '구대성',
      'stats': '방어율: 0.93, 1승 1패 3세이브'
    },
    {
      'team': '1998년 한국시리즈 우승팀\n 현대 유니콘스',
      'logo': 'assets/KSLogo/1998.jpg',
      'bgPic': 'assets/KSBG/1998.jpg',
      'mvpPic': 'assets/KSmvp/1998.jpg',
      'score': '81승 0무 45패 (승률 0.643) 정규 시즌 1위',
      'mvp': '정민태',
      'stats': '방어율: 0.51, 3경기 2승'
    },
    {
      'team': '1997년 한국시리즈 우승팀\n 해태 타이거즈',
      'logo': 'assets/KSLogo/1997.jpg',
      'bgPic': 'assets/KSBG/1997.jpg',
      'mvpPic': 'assets/KSmvp/1997.jpg',
      'score': '75승 1무 50패 (승률 0.599) 정규 시즌 1위',
      'mvp': '이종범',
      'stats': '타율 0.294, 3홈런 4타점 6득점'
    },
    {
      'team': '1996년 한국시리즈 우승팀\n 해태 타이거즈',
      'logo': 'assets/KSLogo/1996.jpg',
      'bgPic': 'assets/KSBG/1996.jpg',
      'mvpPic': 'assets/KSmvp/1996.jpg',
      'score': '73승 2무 51패 (승률 0.587) 정규 시즌 1위',
      'mvp': '이강철',
      'stats': '방어율: 0.56, 2승 1세이브'
    },
    {
      'team': '1995년 한국시리즈 우승팀\n OB 베어스',
      'logo': 'assets/KSLogo/1995.jpg',
      'bgPic': 'assets/KSBG/1995.jpg',
      'mvpPic': 'assets/KSmvp/1995.jpg',
      'score': '74승 5무 47패 (승률 0.607) 정규 시즌 1위',
      'mvp': '김민호',
      'stats': '타율: 0.387, 2타점 5득점'
    },
    {
      'team': '1994년 한국시리즈 우승팀\n LG 트윈스',
      'logo': 'assets/KSLogo/1994.jpg',
      'bgPic': 'assets/KSBG/1994.jpg',
      'mvpPic': 'assets/KSmvp/1994.jpg',
      'score': '81승 0무 45패 (승률 0.643) 정규 시즌 1위',
      'mvp': '김용수',
      'stats': '방어율: 0, 1승 2세이브'
    },
    {
      'team': '1993년 한국시리즈 우승팀\n 해태 타이거즈',
      'logo': 'assets/KSLogo/1993.jpg',
      'bgPic': 'assets/KSBG/1993.jpg',
      'mvpPic': 'assets/KSmvp/1993.jpg',
      'score': '81승 3무 42패 (승률 0.655) 정규 시즌 1위',
      'mvp': '이종범',
      'stats': '타율 0.310, 4타점 3득점'
    },
    {
      'team': '1992년 한국시리즈 우승팀\n 롯데 자이언츠',
      'logo': 'assets/KSLogo/1992.jpg',
      'bgPic': 'assets/KSBG/1992.jpg',
      'mvpPic': 'assets/KSmvp/1992.jpg',
      'score': '71승 0무 55패 (승률 0.563) 정규 시즌 3위',
      'mvp': '박동희',
      'stats': '방어율: 3.07, 2승 1세이브'
    },
    {
      'team': '1991년 한국시리즈 우승팀\n 해태 타이거즈',
      'logo': 'assets/KSLogo/1991.jpg',
      'bgPic': 'assets/KSBG/1991.jpg',
      'mvpPic': 'assets/KSmvp/1991.jpg',
      'score': '79승 5무 42패 (승률 0.647) 정규 시즌 1위',
      'mvp': '장채근',
      'stats': '타율 0.467, 8타점 4득점'
    },
    {
      'team': '1990년 한국시리즈 우승팀\n LG 트윈스',
      'logo': 'assets/KSLogo/1990.jpg',
      'bgPic': 'assets/KSBG/1990.jpg',
      'mvpPic': 'assets/KSmvp/1990.jpg',
      'score': '71승 0무 49패 (승률 0.592) 정규 시즌 1위',
      'mvp': '김용수',
      'stats': '방어율: 1.29, 2경기 2승'
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
              'assets/historyPic/1990.jpg',
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
