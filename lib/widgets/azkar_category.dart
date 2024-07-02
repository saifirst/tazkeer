import 'package:flutter/material.dart';
import 'package:tathkeer/data/zekr.dart';
import 'package:tathkeer/screens/zekr_screen.dart';

class AthkarCategory extends StatelessWidget {
  const AthkarCategory({super.key, required this.thekr});
  final Thekr thekr;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ThekrScreen(thekr: thekr)));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: SizedBox(
          width: 156,
          height: 170,
          child: Stack(
            children: [
              Image.asset(thekr.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    thekr.title,
                    textAlign: TextAlign.center,
                    textScaler: const TextScaler.linear(1.0),
                    style: const TextStyle(
                      fontFamily: 'GE_SS_TWO',
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
