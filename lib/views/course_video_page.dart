import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseVideoPage extends StatefulWidget {
  const CourseVideoPage({super.key});

  @override
  State<CourseVideoPage> createState() => _CourseVideoPageState();
}

class _CourseVideoPageState extends State<CourseVideoPage> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'M5THtQr2reI',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      // mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: Navigator.pop(context),
          ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: double.infinity,
        height: 1000,
        child: SingleChildScrollView(
          child: Column(
            children: [
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text("🧭📱 Navigation & Routes • Flutter Tutorial"),
                ],
              ),
              SizedBox(height: 30),
              Text("""
📱 Flutter Courses • https://mitchkoko.app/
💰 Hire Me / Book Consultation Call • https://mitchkoko.gumroad.com/l/CallW...
❤️ True Fans • / mitchkoko  

📱 INSTAGRAM • / createdbykoko

🐦 TWITTER • / createdbykoko  

📱 TIKTOK • / createdbykoko  

🎧 FLUTTER POD • / @flutterpod  

💬 JOIN DISCORD SERVER • / discord  
💻 GITHUB • https://github.com/mitchkoko/
🖥 WEBSITE • https://mitchkoko.app/
Расшифровка видео
Расшифровка позволяет быстро находить в видео нужную информацию.


Malumot

2015-yilda Google kompaniyasi tomonidan ishlab chiqilgan ushbu tizim bir vaqtning o‘zida Android, IOS, Windows, MacOS, Linux operatsion tizimlari uchun dasturlar yaratish imkoniyatini beradi. Shu sababli Flutter Developmentga dunyo buyicha talab yuqori.

Flutterning birinchi versiyasi “Sky” kod nomi bilan tanilgan va Android operatsion tizimida ishlaydi. Bu 2015 Dart dasturchilar sammitida e’lon qilindi, sekundiga 120 kvadrat tezlikda ishlash imkoniyatiga ega bo’lish. Shanxayda Google dasturchilar kunlarining asosiy nutqida Google Flutter 1.0-dan oldingi so’nggi yirik nashr bo’lgan Flutter Release Preview 2 ni e’lon qildi. 2018 yil 4 dekabr kuni Flutter 1.0 Flutter Live tadbirida Framework-ning birinchi “barqaror” versiyasini bildirgan holda chiqarildi. Flutter Interfaol tadbirida 2019 yil 11-dekabr kuni Flutter 1.12 sotuvga chiqarildi.

2020 yil 6-may kuni 2.8 versiyadagi Dart SDK va 1.17.0 versiyadagi Flutter chiqdi, unda iOS API qurilmalarida ish faoliyatini yaxshilash (taxminan 50%), yangi Moddiy vidjetlar va yangi tarmoqni Metal API qo’llab-quvvatladi.
"""),
            ],
          ),
        ),
      ),
    );
  }
}
