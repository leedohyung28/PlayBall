import 'package:flutter/material.dart';
import 'package:flutter_application_1/Headers/ResponsiveAppBar.dart';
import 'package:flutter_application_1/Headers/ResponsiveDrawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String urlVideoFromYouTube = 'GKB9Ed-_zQ0';
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: urlVideoFromYouTube,
      autoPlay: true,
      params: const YoutubePlayerParams(
        enableCaption: false,
        showVideoAnnotations: false,
        showControls: false,
        mute: true,
        loop: true,
        showFullscreenButton: false,
        pointerEvents: PointerEvents.none,
      ),
    )..listen((event) {
        if (event.playerState == PlayerState.ended) {
          _controller.seekTo(seconds: 0);
          _controller.playVideo();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final isDesktop = width > 800;

    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.06),
          child: PointerInterceptor(child: const ResponsiveAppBar()),
        ),
        drawer: isDesktop
            ? null
            : PointerInterceptor(child: const ResponsiveDrawer()),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: width > 600 ? height * 0.5 : width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/mainBackground2.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: YoutubePlayerScaffold(
                        controller: _controller,
                        builder: (BuildContext context, Widget player) {
                          return Column(
                            children: [
                              player,
                            ],
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: height * 0.06,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: height * 0.06,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Play Ball',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: height * 0.05,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'UndergroundNF'),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.2,
                      left: 0,
                      right: 0,
                      child: PointerInterceptor(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    'https://www.koreabaseball.com/'));
                              },
                              child: Container(
                                height: height * 0.09,
                                width: height * 0.12,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white, // 버튼 배경색을 흰색으로 설정합니다.
                                  borderRadius: BorderRadius.circular(
                                      10.0), // 버튼의 모서리를 둥글게 만듭니다.
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/logo/kbo.png',
                                      height: height * 0.04,
                                      fit: BoxFit.fitHeight,
                                    ),
                                    Text(
                                      'KBO 홈페이지',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: height * 0.015,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    'https://www.koreabaseball.com/Record/TeamRank/TeamRank.aspx'));
                              },
                              child: Container(
                                height: height * 0.09,
                                width: height * 0.12,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.chartSimple,
                                      size: height * 0.04,
                                    ),
                                    Text(
                                      '순위',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: height * 0.015,
                                      ),
                                      textAlign: TextAlign
                                          .center, // 텍스트 색상을 검은색으로 설정합니다.
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    'https://www.koreabaseball.com/Schedule/Schedule.aspx'));
                              },
                              child: Container(
                                height: height * 0.09,
                                width: height * 0.12,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.solidCalendar,
                                      size: height * 0.04,
                                    ),
                                    Text(
                                      '일정',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: height * 0.015,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                PointerInterceptor(
                  child: Container(
                    height: height * 0.6,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/mainBackground2.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StrokeText(
                            text: "Play Ball 특징",
                            textStyle: TextStyle(
                              fontSize: height * 0.05,
                              color: Colors.black,
                            ),
                            strokeColor: Colors.white,
                            strokeWidth: 2,
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          StrokeText(
                            text: "- 각종 야구 기록 및 일정 확인 가능",
                            textStyle: TextStyle(
                              fontSize: height * 0.02,
                              color: Colors.black,
                            ),
                            strokeColor: Colors.white,
                            strokeWidth: 1.5,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          StrokeText(
                            text: "- KBO 팀 소개 및 티켓 예매 기능",
                            textStyle: TextStyle(
                              fontSize: height * 0.02,
                              color: Colors.black,
                            ),
                            strokeColor: Colors.white,
                            strokeWidth: 1.5,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          StrokeText(
                            text: "- 한국시리즈 우승팀 확인 가능",
                            textStyle: TextStyle(
                              fontSize: height * 0.02,
                              color: Colors.black,
                            ),
                            strokeColor: Colors.white,
                            strokeWidth: 1.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: width * 0.4,
                  width: width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/logo/mlb.png',
                        width: width * 0.2,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          StrokeText(
                            text: "Major League Baseball",
                            textStyle: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            strokeColor: Colors.black,
                            strokeWidth: 2,
                          ),
                          SizedBox(
                            height: width * 0.03,
                          ),
                          StrokeText(
                            text: "1903년 설립",
                            textStyle: TextStyle(
                              fontSize: width * 0.025,
                              color: Colors.white,
                            ),
                            strokeColor: Colors.black,
                            strokeWidth: 1.5,
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          StrokeText(
                            text: "내셔널 리그 (15팀) - 아메리칸 리그 (15팀) : 양대리그 체제",
                            textStyle: TextStyle(
                              fontSize: width * 0.02,
                              color: Colors.white,
                            ),
                            strokeColor: Colors.black,
                            strokeWidth: 1.5,
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          StrokeText(
                            text: "최다 우승팀 : New York Yankees (27회)",
                            textStyle: TextStyle(
                              fontSize: width * 0.025,
                              color: Colors.white,
                            ),
                            strokeColor: Colors.black,
                            strokeWidth: 1.5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: width * 0.4,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/mlbBackground.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: PointerInterceptor(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            launchUrl(Uri.parse('https://www.mlb.com/'));
                          },
                          child: Container(
                            height: width * 0.15,
                            width: width * 0.15,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white, // 버튼 배경색을 흰색으로 설정합니다.
                              borderRadius: BorderRadius.circular(
                                  10.0), // 버튼의 모서리를 둥글게 만듭니다.
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/logo/mlb.png',
                                  height: width * 0.08,
                                  fit: BoxFit.fitHeight,
                                ),
                                Text(
                                  'MLB.COM',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: width * 0.02,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchUrl(
                                Uri.parse('https://www.mlb.com/standings'));
                          },
                          child: Container(
                            height: width * 0.15,
                            width: width * 0.15,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.chartSimple,
                                  size: width * 0.08,
                                ),
                                Text(
                                  '순위',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: width * 0.02,
                                  ),
                                  textAlign:
                                      TextAlign.center, // 텍스트 색상을 검은색으로 설정합니다.
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchUrl(
                                Uri.parse('https://www.mlb.com/schedule'));
                          },
                          child: Container(
                            height: width * 0.15,
                            width: width * 0.15,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white, // 버튼 배경색을 흰색으로 설정합니다.
                              borderRadius: BorderRadius.circular(
                                  10.0), // 버튼의 모서리를 둥글게 만듭니다.
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.solidCalendar,
                                  size: width * 0.08,
                                ),
                                Text(
                                  '일정',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: width * 0.02,
                                  ),
                                  textAlign:
                                      TextAlign.center, // 텍스트 색상을 검은색으로 설정합니다.
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchUrl(Uri.parse(
                                'https://www.msn.com/ko-kr/sports/baseball/mlb'));
                          },
                          child: Container(
                            height: width * 0.15,
                            width: width * 0.15,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white, // 버튼 배경색을 흰색으로 설정합니다.
                              borderRadius: BorderRadius.circular(
                                  10.0), // 버튼의 모서리를 둥글게 만듭니다.
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.solidCalendar,
                                  size: width * 0.08,
                                ),
                                Text(
                                  'MLB 소식',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: width * 0.02,
                                  ),
                                  textAlign:
                                      TextAlign.center, // 텍스트 색상을 검은색으로 설정합니다.
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: width * 0.4,
                  width: width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StrokeText(
                            text: "Nippon Professional Baseball",
                            textStyle: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            strokeColor: Colors.black,
                            strokeWidth: 2,
                          ),
                          SizedBox(
                            height: width * 0.03,
                          ),
                          StrokeText(
                            text: "1936년 설립",
                            textStyle: TextStyle(
                              fontSize: width * 0.025,
                              color: Colors.white,
                            ),
                            strokeColor: Colors.black,
                            strokeWidth: 1.5,
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          StrokeText(
                            text: "센트럴 리그 (6팀) - 퍼시픽 리그 (6팀) : 양대리그 체제",
                            textStyle: TextStyle(
                              fontSize: width * 0.02,
                              color: Colors.white,
                            ),
                            strokeColor: Colors.black,
                            strokeWidth: 1.5,
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          StrokeText(
                            text: "최다 우승팀 : 요미우리 자이언츠 (27회)",
                            textStyle: TextStyle(
                              fontSize: width * 0.025,
                              color: Colors.white,
                            ),
                            strokeColor: Colors.black,
                            strokeWidth: 1.5,
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/logo/npb.png',
                        width: width * 0.2,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: width * 0.4,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/npbBackground.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: PointerInterceptor(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            launchUrl(Uri.parse('https://npb.jp/eng/'));
                          },
                          child: Container(
                            height: width * 0.15,
                            width: width * 0.15,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white, // 버튼 배경색을 흰색으로 설정합니다.
                              borderRadius: BorderRadius.circular(
                                  10.0), // 버튼의 모서리를 둥글게 만듭니다.
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/logo/npb.png',
                                  height: width * 0.08,
                                  fit: BoxFit.fitHeight,
                                ),
                                Text(
                                  'NPB 홈페이지',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: width * 0.02,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchUrl(Uri.parse(
                                'https://npb.jp/bis/eng/2023/standings/'));
                          },
                          child: Container(
                            height: width * 0.15,
                            width: width * 0.15,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.chartSimple,
                                  size: width * 0.08,
                                ),
                                Text(
                                  '순위',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: width * 0.02,
                                  ),
                                  textAlign:
                                      TextAlign.center, // 텍스트 색상을 검은색으로 설정합니다.
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchUrl(Uri.parse(
                                'https://npb.jp/bis/eng/2023/calendar/'));
                          },
                          child: Container(
                            height: width * 0.15,
                            width: width * 0.15,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white, // 버튼 배경색을 흰색으로 설정합니다.
                              borderRadius: BorderRadius.circular(
                                  10.0), // 버튼의 모서리를 둥글게 만듭니다.
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.solidCalendar,
                                  size: width * 0.08,
                                ),
                                Text(
                                  '일정',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: width * 0.02,
                                  ),
                                  textAlign:
                                      TextAlign.center, // 텍스트 색상을 검은색으로 설정합니다.
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchUrl(
                                Uri.parse('https://japanball.com/npb-news/'));
                          },
                          child: Container(
                            height: width * 0.15,
                            width: width * 0.15,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white, // 버튼 배경색을 흰색으로 설정합니다.
                              borderRadius: BorderRadius.circular(
                                  10.0), // 버튼의 모서리를 둥글게 만듭니다.
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.solidCalendar,
                                  size: width * 0.08,
                                ),
                                Text(
                                  'NPB 소식',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: width * 0.02,
                                  ),
                                  textAlign:
                                      TextAlign.center, // 텍스트 색상을 검은색으로 설정합니다.
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
