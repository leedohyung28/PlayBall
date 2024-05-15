import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Headers/ResponsiveAppBar.dart';
import 'package:flutter_application_1/Headers/ResponsiveDrawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

class Teams extends StatefulWidget {
  const Teams({super.key});

  @override
  State<Teams> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  final List<Map<String, dynamic>> boxData = [
    {
      'color': const Color(0xff041E42).withOpacity(0.7),
      'pricolor': const Color(0xff141C25),
      'image': 'assets/teamLogo/lotte.svg',
      'text': '롯데 자이언츠',
      'start': '1982년',
      'win': '2회',
      'hover': 'assets/teamHoverLogo/lotte.svg',
      'slogan': 'assets/teamSlogan/lotte.jpg',
      'instaUrl': 'https://www.instagram.com/busanlottegiants/',
      'homepageUrl': 'https://www.giantsclub.com/html/',
      'shopUrl': 'https://www.lottegiantsshop.com/',
    },
    {
      'color': const Color(0xff074CA1).withOpacity(0.7),
      'pricolor': Colors.white,
      'image': 'assets/teamLogo/samsung.svg',
      'text': '삼성 라이온즈',
      'start': '1982년',
      'win': '8회',
      'hover': 'assets/teamHoverLogo/samsung.svg',
      'slogan': 'assets/teamSlogan/samsung.jpg',
      'instaUrl': 'https://www.instagram.com/samsunglions_baseballclub/',
      'homepageUrl': 'https://www.samsunglions.com/',
      'shopUrl': 'https://samsunglionsmall.com/',
    },
    {
      'color': const Color(0xff131230).withOpacity(0.7),
      'pricolor': Colors.white,
      'image': 'assets/teamLogo/doosan.svg',
      'text': '두산 베어스',
      'start': '1982년',
      'win': '6회',
      'hover': 'assets/teamHoverLogo/doosan.svg',
      'slogan': 'assets/teamSlogan/doosan.jpg',
      'instaUrl': 'https://www.instagram.com/doosanbears.1982/',
      'homepageUrl': 'https://www.doosanbears.com/',
      'shopUrl': 'https://www.doosanbearswefan.shop/shop/main/index.php',
    },
    {
      'color': const Color(0xffFF6600).withOpacity(0.7),
      'pricolor': const Color(0xff000000),
      'image': 'assets/teamLogo/hanwha.svg',
      'text': '한화 이글스',
      'start': '1986년',
      'win': '1회',
      'hover': 'assets/teamHoverLogo/hanwha.svg',
      'slogan': 'assets/teamSlogan/hanwha.jpg',
      'instaUrl': 'https://www.instagram.com/hanwhaeagles_soori/',
      'homepageUrl': 'https://www.hanwhaeagles.co.kr/index.do',
      'shopUrl': 'https://www.eaglesshop.co.kr/',
    },
    {
      'color': const Color(0xffC30452).withOpacity(0.7),
      'pricolor': const Color(0xff7A171C),
      'image': 'assets/teamLogo/lg.svg',
      'text': 'LG 트윈스',
      'start': '1990년',
      'win': '3회',
      'hover': 'assets/teamHoverLogo/lg.svg',
      'slogan': 'assets/teamSlogan/lg.jpg',
      'instaUrl': 'https://www.instagram.com/lgtwinsbaseballclub/',
      'homepageUrl':
          'https://www.lgtwins.com/service/html.ncd?view=/pc_twins/twins_main/twins_main',
      'shopUrl':
          'https://mticket.interpark.com/Promotion/Event/MDShopList?dispNo=001780002003',
    },
    {
      'color': const Color(0xffEA0029).withOpacity(0.7),
      'pricolor': Colors.white,
      'image': 'assets/teamLogo/kia.svg',
      'text': 'KIA 타이거즈',
      'start': '2001년',
      'win': '11회',
      'hover': 'assets/teamHoverLogo/kia.svg',
      'slogan': 'assets/teamSlogan/kia.jpg',
      'instaUrl': 'https://www.instagram.com/always_kia_tigers/',
      'homepageUrl': 'https://tigers.co.kr/',
      'shopUrl': 'https://teamstore.tigers.co.kr/',
    },
    {
      'color': const Color(0xff570514).withOpacity(0.7),
      'pricolor': const Color(0xff570514),
      'image': 'assets/teamLogo/kiwoom.svg',
      'text': '키움 히어로즈',
      'start': '2008년',
      'win': '없음',
      'hover': 'assets/teamHoverLogo/kiwoom.svg',
      'slogan': 'assets/teamSlogan/kiwoom.jpg',
      'instaUrl': 'https://www.instagram.com/heroesbaseballclub/',
      'homepageUrl': 'https://www.heroesbaseball.co.kr/index.do',
      'shopUrl':
          'https://mticket.interpark.com/Promotion/Event/MDShopList?dispNo=001780002001',
    },
    {
      'color': const Color(0xff315288).withOpacity(0.7),
      'pricolor': const Color(0xff1D4791),
      'image': 'assets/teamLogo/nc.svg',
      'text': 'NC 다이노스',
      'start': '2011',
      'win': '1회',
      'hover': 'assets/teamHoverLogo/nc.svg',
      'slogan': 'assets/teamSlogan/nc.jpg',
      'instaUrl': 'https://www.instagram.com/ncdinos2011/',
      'homepageUrl': 'https://www.ncdinos.com/',
      'shopUrl': 'https://store.ncdinos.com/',
    },
    {
      'color': const Color(0xff000000).withOpacity(0.7),
      'pricolor': Colors.white,
      'image': 'assets/teamLogo/kt.svg',
      'text': 'KT 위즈',
      'start': '2013',
      'win': '1회',
      'hover': 'assets/teamHoverLogo/kt.svg',
      'slogan': 'assets/teamSlogan/kt.jpg',
      'instaUrl': 'https://www.instagram.com/ktwiz.pr/',
      'homepageUrl': 'https://www.ktwiz.co.kr/',
      'shopUrl': 'https://ktwizstore.co.kr/'
    },
    {
      'color': const Color(0xffCE0E2D).withOpacity(0.7),
      'pricolor': const Color(0xff861D20),
      'image': 'assets/teamLogo/ssg.svg',
      'text': 'SSG 랜더스',
      'start': '2021',
      'win': '5회',
      'hover': 'assets/teamHoverLogo/ssg.svg',
      'slogan': 'assets/teamSlogan/ssg.jpg',
      'instaUrl': 'https://www.instagram.com/ssglanders.incheon/',
      'homepageUrl': 'https://www.ssglanders.com/main',
      'shopUrl': 'https://ssglandersstore.co.kr/',
    },
  ];

  int hoverIndex = -1;

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    var width = MediaQuery.of(context).size.width;
    var maxHW = max(width, MediaQuery.of(context).size.height);

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
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return MouseRegion(
              onEnter: (_) => setState(() => hoverIndex = index),
              onExit: (_) => setState(() => hoverIndex = -1),
              child: Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: hoverIndex != index
                      ? boxData[index]['color'] as Color
                      : boxData[index]['pricolor'] as Color,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: boxData[index]['color'] as Color,
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
                                boxData[index]['image'] as String,
                              )
                            : Image.asset(boxData[index]['slogan'] as String),
                      ),
                    ),
                    if (hoverIndex == index) ...[
                      FractionallySizedBox(
                        heightFactor: 0.2,
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.7),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6)),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.7),
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: maxHW * 0.03,
                                width: maxHW * 0.04,
                                child: IconButton(
                                  onPressed: () {
                                    launchUrl(Uri.parse(
                                        boxData[index]['homepageUrl']));
                                  },
                                  icon: SvgPicture.asset(
                                    boxData[index]['hover'] as String,
                                    fit: BoxFit.contain,
                                  ),
                                  color: const Color(0xff777737),
                                ),
                              ),
                              SizedBox(
                                height: maxHW * 0.03,
                                width: maxHW * 0.04,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: IconButton(
                                    onPressed: () {
                                      launchUrl(Uri.parse(
                                          boxData[index]['instaUrl']));
                                    },
                                    icon: const FaIcon(
                                        FontAwesomeIcons.instagram),
                                    color: const Color(0xffE1306C),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: maxHW * 0.03,
                                width: maxHW * 0.04,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: IconButton(
                                    onPressed: () {
                                      launchUrl(
                                          Uri.parse(boxData[index]['shopUrl']));
                                    },
                                    icon: const FaIcon(FontAwesomeIcons.gift),
                                    color: const Color(0xff833AB4),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: hoverIndex != index
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    boxData[index]['text'] as String,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '창단 연도: ' + boxData[index]['start'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    '우승 횟수: ' + boxData[index]['win'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
