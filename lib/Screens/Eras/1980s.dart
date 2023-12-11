import 'package:flutter/material.dart';
import 'package:flutter_application_1/Headers/ResponsiveAppBar.dart';
import 'package:flutter_application_1/Headers/ResponsiveDrawer.dart';

class history1980s extends StatefulWidget {
  const history1980s({super.key});

  @override
  State<history1980s> createState() => _history1980sState();
}

class _history1980sState extends State<history1980s> {
  final List<Map<String, dynamic>> historyData = [
    {
      'team': '1989년 한국시리즈 우승팀\n 해태 타이거즈',
      'logo': 'assets/KSLogo/1989.jpg',
      'bgPic': 'assets/KSBG/1989.jpg',
      'mvpPic': 'assets/KSmvp/1989.jpg',
      'score': '65승 4무 51패 (승률 0.558) 정규 시즌 2위',
      'mvp': '박철우',
      'stats': '타율 0.444, 1타점 4득점'
    },
    {
      'team': '1988년 한국시리즈 우승팀\n 해태 타이거즈',
      'logo': 'assets/KSLogo/1988.jpg',
      'bgPic': 'assets/KSBG/1988.jpg',
      'mvpPic': 'assets/KSmvp/1988.jpg',
      'score': '68승 2무 38패 (승률 0.639) 통합 승률 1위',
      'mvp': '문희수',
      'stats': '방어율: 0.46, 2승 1세이브'
    },
    {
      'team': '1987년 한국시리즈 우승팀\n 해태 타이거즈',
      'logo': 'assets/KSLogo/1987.jpg',
      'bgPic': 'assets/KSBG/1987.jpg',
      'mvpPic': 'assets/KSmvp/1987.jpg',
      'score': '55승 5무 48패 (승률 0.532) 통합 승률 1위',
      'mvp': '김준환',
      'stats': '타율: 0.500, 2홈런 4타점 5득점'
    },
    {
      'team': '1986년 한국시리즈 우승팀\n 해태 타이거즈',
      'logo': 'assets/KSLogo/1986.jpg',
      'bgPic': 'assets/KSBG/1986.jpg',
      'mvpPic': 'assets/KSmvp/1986.jpg',
      'score': '67승 4무 37패 (승률 0.644) 통합 승률 2위',
      'mvp': '김정수',
      'stats': '방어율: 2.45, 4경기 3승'
    },
    {
      'team': '1985년 통합 우승팀\n 삼성 라이온즈',
      'logo': 'assets/KSLogo/1985.jpg',
      'bgPic': 'assets/KSBG/1985.jpg',
      'mvpPic': 'assets/KSmvp/1985.jpg',
      'score': '77승 1무 32패 (승률 0.706) 통합 승률 1위',
      'mvp': '-',
      'stats': '-'
    },
    {
      'team': '1984년 한국시리즈 우승팀\n 롯데 자이언츠',
      'logo': 'assets/KSLogo/1984.jpg',
      'bgPic': 'assets/KSBG/1984.jpg',
      'mvpPic': 'assets/KSmvp/1984.jpg',
      'score': '50승 2무 48패 (승률 0.510) 통합 승률 4위',
      'mvp': '유두열',
      'stats': '타율: 0.143, 1홈런 3타점 3득점'
    },
    {
      'team': '1983년 한국시리즈 우승팀\n 해태 타이거즈',
      'logo': 'assets/KSLogo/1983.jpg',
      'bgPic': 'assets/KSBG/1983.jpg',
      'mvpPic': 'assets/KSmvp/1983.jpg',
      'score': '55승 1무 44패 (승률 0.639) 통합 승률 2위',
      'mvp': '김봉연',
      'stats': '타율: 0.375, 1홈런 8타점 4득점'
    },
    {
      'team': '1982년 한국시리즈 우승팀\n OB 베어스',
      'logo': 'assets/KSLogo/1982.jpg',
      'bgPic': 'assets/KSBG/1982.jpg',
      'mvpPic': 'assets/KSmvp/1982.jpg',
      'score': '56승 0무 24패 (승률 0.700) 통합 승률 1위',
      'mvp': '김유동',
      'stats': '타율: 0.400, 3홈런 12타점 3득점'
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
              'assets/historyPic/1980.jpg',
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
