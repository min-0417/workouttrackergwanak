import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  Icon icon;
  Text title;
  Widget info;
  Color? backgroundColor;
  // String? imageName;

  DashboardCard({
    required this.icon,
    required this.title,
    required this.info,
    this.backgroundColor,
    // this.imageName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: backgroundColor ?? Colors.grey.shade300,
      ),
      child: Column(
        children: [
          Row(
            children: [
              icon,
              // Icon(
              //   Icons.fitness_center,
              //   size: Theme.of(context).textTheme.headlineSmall?.fontSize,
              //   color: Theme.of(context).colorScheme.primary,
              // ),
              SizedBox(width: 10),
              title,
            ],
          ),
          Expanded(
            child: Center(
              child: info,
            ),
            // children: [
            //   info,
            //   // 부모로부터 이미지를 받으면,
            //   // 이미지를 출력
            //   // NULL이면 빈 컨테이너
            //   imageName != null
            //       ? Image.asset('assets/$imageName')
            //       : Container()
            //
            //   // Container(
            //   //   child: Image.asset('assets/sample1.png'),
            //   // ),
            // ],
          ),

          // Text(
          //   '12회',
          //   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          //         fontWeight: FontWeight.bold,
          //       ),
          // ),
        ],
      ),
    );
  }
}
