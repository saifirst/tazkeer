import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tathkeer/data/zekr.dart';
import 'package:tathkeer/screens/azkar_screen.dart';

class ThekrScreen extends StatefulWidget {
  const ThekrScreen({super.key, required this.thekr});
  final Thekr thekr;

  @override
  State<ThekrScreen> createState() => _ThekrScreenState();
}

class _ThekrScreenState extends State<ThekrScreen> {
  var _currentindex = 0;
  var count;
  @override
  void initState() {
    super.initState();
    count = widget.thekr.athkarAndCount[_currentindex].values.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: const BoxDecoration(color: Color(0xFF030301)),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 48),
                  child: Text(widget.thekr.title,
                      textScaler: const TextScaler.linear(1.0),
                      style: const TextStyle(
                          fontFamily: 'GE_SS_TWO',
                          fontSize: 48,
                          color: Colors.white))),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.only(top: 48),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24)),
                      child: Stack(fit: StackFit.expand, children: [
                        ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                              Color(0xFF576CA8), BlendMode.multiply),
                          child: Image.asset(
                            'assets/images/Texture.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 32, horizontal: 18),
                          child: Column(
                            children: [
                              Text(
                                  widget.thekr.athkarAndCount[_currentindex]
                                      .keys.first
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  textScaler: const TextScaler.linear(1.0),
                                  style: const TextStyle(
                                      fontFamily: 'Alvi',
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w300,
                                      height: 1.8)),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  if (_currentindex ==
                                      widget.thekr.athkarAndCount.length - 1) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AthkarScreen()));
                                  }
                                  setState(() {
                                    if (count > 1) {
                                      count--;
                                    } else {
                                      _currentindex++;
                                      count = widget
                                          .thekr
                                          .athkarAndCount[_currentindex]
                                          .values
                                          .first;
                                    }
                                  });
                                },
                                onLongPress: () {
                                  if (_currentindex <
                                      widget.thekr.athkarAndCount.length - 1) {
                                    setState(() {
                                      _currentindex++;
                                      count = widget
                                          .thekr
                                          .athkarAndCount[_currentindex]
                                          .values
                                          .first;
                                    });
                                  } else {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AthkarScreen()));
                                  }
                                },
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(count.toString(),
                                          textScaler:
                                              const TextScaler.linear(1.0),
                                          style: GoogleFonts.outfit(
                                              fontSize: 48,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              height: 1.1)),
                                      const Text(
                                        'مرات',
                                        textAlign: TextAlign.center,
                                        textScaler:
                                            const TextScaler.linear(1.0),
                                        style: TextStyle(
                                          fontFamily: 'GE_SS_TWO',
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'اضغط مطولًا للانتقال إلى الذكر التالي',
                                textScaler: const TextScaler.linear(1.0),
                                style: TextStyle(
                                  fontFamily: 'GE_SS_TWO',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        )
                      ]),
                    )),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
