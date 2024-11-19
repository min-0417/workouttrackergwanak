import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/runner.png'),
              fit: BoxFit.cover,
              opacity: 0.2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                color: Colors.yellowAccent,
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(15),
                width: 300,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  '남들이 그만둘 때, 난 계속한다.',
                  style: TextStyle(fontSize: 23, fontFamily: 'NanumBrushScrit'),
                ),
              ),
              // Container(
              //   width: 300,
              //   child: Image(
              //     image: AssetImage('assets/runner.png'),
              //   ),
              // ),
              Container(
                child: Text(
                  '환영합니다.',
                  style: TextStyle(
                    fontFamily: 'Jua',
                    fontSize: 33,
                  ),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text(
              //     'Start',
              //     style: TextStyle(fontSize: 35),
              //   ),
              // ),
              OutlinedButton(
                onPressed: () {},
                child: Text('START'),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              ),
              Container(
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
