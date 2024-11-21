import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard_card.dart';

class WorkoutHomePage extends StatefulWidget {
  const WorkoutHomePage({super.key});

  @override
  State<WorkoutHomePage> createState() => _WorkoutHomePageState();
}

class _WorkoutHomePageState extends State<WorkoutHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //a
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('Just Do It'),
                      Text('간단하다. 흔들리면 그것은 지방이다.'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/me.jpg'),
                    ),
                  ),
                ),
              ],
            ),
            //b
            Expanded(
              flex: 6,
              child: Row(
                children: [
                  Expanded(
                    child: DashboardCard(
                      icon: Icon(
                        Icons.fitness_center,
                        size:
                            Theme.of(context).textTheme.headlineSmall?.fontSize,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      title: Text(
                        'Monthly',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      info: Text(
                        '12회',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: DashboardCard(
                            icon: Icon(
                              Icons.update,
                              size: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.fontSize,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            title: Text(
                              '오늘운동시간',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            info: Text(
                              '10분',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          child: DashboardCard(
                            icon: Icon(
                              Icons.fitness_center,
                              size: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.fontSize,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            title: Text(
                              '소모칼로리',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            info: Text(
                              '100Kcal',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //c
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                        child: DashboardCard(
                          icon: Icon(
                            Icons.run_circle_outlined,
                            size: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.fontSize,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          title: Text(
                            '그룹1',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          info: Text(
                            '아침을 여는 5가지 운동 프로그램',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.surfaceTint,
                        ),
                        width: 250),
                    SizedBox(
                        child: DashboardCard(
                          icon: Icon(
                            Icons.rowing_outlined,
                            size: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.fontSize,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          title: Text(
                            '그룹2',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          info: Text(
                            '근력을 키우는 7가지 프로그램',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                        ),
                        width: 250),
                  ],
                ),
              ),
            ),
            //d
            Expanded(
              flex: 3,
              child: DashboardCard(
                icon: Icon(
                  Icons.list,
                  size: Theme.of(context).textTheme.headlineSmall?.fontSize,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  '운동 이어서 하기',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                info: Text(
                  '당신의 몸은 해 낼 수 있다. 당신의 마음만 설득하면 되다.',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                backgroundColor: Theme.of(context).colorScheme.surfaceTint,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
