import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tathkeer/screens/azkar_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AthkarScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset('assets/images/HomeScreenBackground.jpg',
            fit: BoxFit.cover, height: double.infinity, width: double.infinity),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 130),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/LOGO.svg',
                ),
                const SizedBox(height: 18),
                const Text(
                  'وَاذْكُر رَّبَّكَ كَثِيرًا وَسَبِّحْ بِالْعَشِيِّ وَالْإِبْكَارِ',
                  textScaler: TextScaler.linear(1.0),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Alvi',
                    fontWeight: FontWeight.w300,
                    fontSize: 24,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Image.asset(
                    'assets/images/Rights.png',
                    width: 120,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
