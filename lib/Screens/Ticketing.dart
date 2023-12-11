import 'package:flutter/material.dart';
import 'package:flutter_application_1/Headers/ResponsiveAppBar.dart';
import 'package:flutter_application_1/Headers/ResponsiveDrawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:url_launcher/url_launcher.dart';

class Ticketing extends StatefulWidget {
  const Ticketing({super.key});

  @override
  State<Ticketing> createState() => _TicketingState();
}

class _TicketingState extends State<Ticketing> {
  final List<Map<String, dynamic>> ticketInfo = [
    {
      'color': const Color(0xffC30452).withOpacity(0.7),
      'team': 'LG 트윈스',
      'arena': '잠실야구장',
      'seats': '23,750석',
      'address': '서울특별시 송파구 올림픽로 25',
      'pic': 'assets/arena/lg.jpg',
      'logo': 'assets/teamLogo/lg.svg',
      'url': 'https://www.ticketlink.co.kr/sports/baseball/59#reservation',
    },
    {
      'color': const Color(0xff131230).withOpacity(0.7),
      'team': '두산 베어스',
      'arena': '잠실야구장',
      'seats': '23,750석',
      'address': '서울특별시 송파구 올림픽로 25',
      'pic': 'assets/arena/doosan.jpg',
      'logo': 'assets/teamLogo/doosan.svg',
      'url': 'https://www.doosanbears.com/season/ticket',
    },
    {
      'color': const Color(0xff570514).withOpacity(0.7),
      'team': '키움 히어로즈',
      'arena': '고척 스카이돔',
      'seats': '16,000석',
      'address': '서울특별시 구로구 경인로 430',
      'pic': 'assets/arena/kiwoom.jpg',
      'logo': 'assets/teamLogo/kiwoom.svg',
      'url':
          'https://ticket.interpark.com/m-ticket/Sports/GoodsInfo?SportsCode=07001',
    },
    {
      'color': const Color(0xffCE0E2D).withOpacity(0.7),
      'team': 'SSG 랜더스',
      'arena': '인천 SSG 랜더스 필드',
      'seats': '23,000석',
      'address': '인천광역시 미추홀구 매소홀로 618',
      'pic': 'assets/arena/ssg.jpg',
      'logo': 'assets/teamLogo/ssg.svg',
      'url': 'https://www.ticketlink.co.kr/sports/baseball/476#reservation',
    },
    {
      'color': const Color(0xff000000).withOpacity(0.7),
      'team': 'KT 위즈',
      'arena': '수원 케이티 위즈 파크',
      'seats': '18,700석',
      'address': '경기도 수원시 장안구 경수대로 893',
      'pic': 'assets/arena/kt.jpg',
      'logo': 'assets/teamLogo/kt.svg',
      'url': 'https://www.ticketlink.co.kr/sports/baseball/62#reservation',
    },
    {
      'color': const Color(0xffFF6600).withOpacity(0.7),
      'team': '한화 이글스',
      'arena': '대전 한화생명 이글스파크',
      'seats': '13,000석',
      'address': '대전광역시 중구 대종로 373',
      'pic': 'assets/arena/hanwha.jpg',
      'logo': 'assets/teamLogo/hanwha.svg',
      'url': 'https://www.ticketlink.co.kr/sports/baseball/63#reservation',
    },
    {
      'color': const Color(0xff074CA1).withOpacity(0.7),
      'team': '삼성 라이온즈',
      'arena': '대구 삼성 라이온즈 파크',
      'seats': '24,000석',
      'address': '대구광역시 수성구 야구전설로 1',
      'pic': 'assets/arena/samsung.jpg',
      'logo': 'assets/teamLogo/samsung.svg',
      'url': 'https://www.ticketlink.co.kr/sports/baseball/57#reservation',
    },
    {
      'color': const Color(0xff041E42).withOpacity(0.7),
      'team': '롯데 자이언츠',
      'arena': '사직 야구장',
      'seats': '22,990석',
      'address': '부산광역시 동래구 사직로 45',
      'pic': 'assets/arena/lotte.jpg',
      'logo': 'assets/teamLogo/lotte.svg',
      'url': 'https://www.giantsclub.com/html/?pcode=339',
    },
    {
      'color': const Color(0xff315288).withOpacity(0.7),
      'team': 'NC 다이노스',
      'arena': '창원 NC 파크',
      'seats': '17,861석',
      'address': '경상남도 창원시 마산회원구 삼호로 63',
      'pic': 'assets/arena/nc.jpg',
      'logo': 'assets/teamLogo/nc.svg',
      'url': 'https://www.ncdinos.com/auth/ticket.do',
    },
    {
      'color': const Color(0xffEA0029).withOpacity(0.7),
      'team': 'KIA 타이거즈',
      'arena': '광주-기아 챔피언스 필드',
      'seats': '20,500석',
      'address': '광주광역시 북구 서림로 10',
      'pic': 'assets/arena/kia.jpg',
      'logo': 'assets/teamLogo/kia.svg',
      'url': 'https://www.ticketlink.co.kr/sports/baseball/58#reservation',
    },
  ];

  int hoverIndex = -1;

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    var width = MediaQuery.of(context).size.width;

    int crossAxisCount;
    if (width < 600) {
      crossAxisCount = 2;
    } else if (width < 900) {
      crossAxisCount = 3; // 화면 너비가 900px 미만일 때 2개 표시
    } else {
      crossAxisCount = 5; // 화면 너비가 900px 이상일 때 3개 표시
    }
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50.0), // 여기에 원하는 높이를 설정하세요
        child: ResponsiveAppBar(), // AppBar를 사용하는 대신 원하는 위젯을 이곳에 배치하세요
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
          itemCount: 10,
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
                  launchUrl(Uri.parse(ticketInfo[index]['url']));
                },
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: hoverIndex != index
                        ? ticketInfo[index]['color'] as Color
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: ticketInfo[index]['color'] as Color,
                      width: 2,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Transform.scale(
                          scale: 1.0,
                          child: hoverIndex != index
                              ? SvgPicture.asset(
                                  ticketInfo[index]['logo'] as String,
                                )
                              : Image.asset(ticketInfo[index]['pic'] as String),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: hoverIndex == index
                              ? Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StrokeText(
                                      text: ticketInfo[index]['arena'],
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                      strokeColor: Colors.black,
                                      strokeWidth: 2,
                                    ),
                                    StrokeText(
                                      text:
                                          '좌석 수: ' + ticketInfo[index]['seats'],
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                      strokeColor: Colors.black,
                                      strokeWidth: 2,
                                    ),
                                    StrokeText(
                                      text: '구장 위치: ' +
                                          ticketInfo[index]['address'],
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.02,
                                      ),
                                      strokeColor: Colors.black,
                                      strokeWidth: 2,
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                        ),
                      ),
                    ],
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
