import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workouttrackergwanak/workout_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'animated_icon_widget.dart';
import 'dashboard_card.dart';

class WorkoutHomePage extends StatefulWidget {
  const WorkoutHomePage({super.key});

  @override
  State<WorkoutHomePage> createState() => _WorkoutHomePageState();
}

class _WorkoutHomePageState extends State<WorkoutHomePage> {
  int i = 0;
  late Future<int> monthlyCountFuture;
  late Future<int> workoutMinuteFuture;
  late Future<int> workoutKcalFuture;
  @override
  void initState() {
    // TODO: implement didUpdateWidget
    super.initState();
    monthlyCountFuture = WorkoutManager.getMonthlyWorkoutCount();
    workoutMinuteFuture = WorkoutManager.getTodayWorkoutMinutes();
    workoutKcalFuture = WorkoutManager.getTodayWorkoutCalories();
  }

  @override
  void didUpdateWidget(covariant WorkoutHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    monthlyCountFuture = WorkoutManager.getMonthlyWorkoutCount();
    workoutMinuteFuture = WorkoutManager.getTodayWorkoutMinutes();
    workoutKcalFuture = WorkoutManager.getTodayWorkoutCalories();
  }

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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment:
                        CrossAxisAlignment.stretch, // 텍스트를 왼쪽으로 정렬
                    children: [
                      Text(
                        'Just Do It',
                        style: TextStyle(fontSize: 33),
                      ),
                      Text(
                        '간단하다. 흔들리면 그것은 지방이다.',
                        style: TextStyle(fontSize: 23),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.orange,
                      width: 4,
                    ),
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
                    flex: 5,
                    child: DashboardCard(
                      // icon: Icon(
                      //   Icons.fitness_center,
                      //   size:
                      //       Theme.of(context).textTheme.headlineSmall?.fontSize,
                      //   color: Theme.of(context).colorScheme.primary,
                      // ),
                      icon: AnimatedIconWidget(
                        icon: Icons.fitness_center,
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
                      info: FutureBuilder(
                          future: monthlyCountFuture, // 함수가 아닌 future타입으로 넘겨줘야함
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            }
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            }
                            final monthlyWorkoutCount = snapshot.data ?? 0;
                            return Text(
                              '$monthlyWorkoutCount회',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            );
                          }),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        Expanded(
                          child: DashboardCard(
                            // icon: Icon(
                            //   Icons.update,
                            //   size: Theme.of(context)
                            //       .textTheme
                            //       .headlineSmall
                            //       ?.fontSize,
                            //   color: Theme.of(context).colorScheme.primary,
                            // ),
                            icon: AnimatedIconWidget(
                              icon: Icons.fitness_center,
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
                            info: FutureBuilder<int>(
                                future: workoutMinuteFuture,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    final todayMinutes = snapshot.data ?? 0;
                                    return Text(
                                      '${todayMinutes}분',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    );
                                  }
                                }),
                          ),
                        ),
                        Expanded(
                          child: DashboardCard(
                            icon: AnimatedIconWidget(
                              icon: Icons.fitness_center,
                              size: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.fontSize,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            // icon: Icon(
                            //   Icons.fitness_center,
                            //   size: Theme.of(context)
                            //       .textTheme
                            //       .headlineSmall
                            //       ?.fontSize,
                            //   color: Theme.of(context).colorScheme.primary,
                            // ),
                            title: Text(
                              '소모칼로리',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            info: FutureBuilder(
                                future: workoutKcalFuture,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    final workoutKcal = snapshot.data ?? 0;
                                    return Text(
                                      '${workoutKcal}Kcal',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    );
                                  }
                                }),
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
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                          child: GestureDetector(
                            onTap: () {
                              context.go('/workout_home/workout_list');
                            },
                            child: DashboardCard(
                              customOntap: () {
                                context.go('/workout_home/workout_list/0');
                              },
                              icon: Icon(
                                Icons.run_circle_outlined,
                                size: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.fontSize,
                                color: Theme.of(context).colorScheme.onPrimary,
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
                              info: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            WorkoutManager.workoutGroups[0]
                                                .groupDescription,
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Image.asset('assets/sample1.png'),
                                  ),
                                ],
                              ),
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                          ),
                          width: 200),
                      SizedBox(
                          child: DashboardCard(
                            customOntap: () {
                              context.go('/workout_home/workout_list/1');
                            },
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
                            info: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          WorkoutManager.workoutGroups[1]
                                              .groupDescription,
                                          style: TextStyle(
                                              fontSize: 23,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Image.asset('assets/sample2.png'),
                                ),
                              ],
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                          width: 200),
                    ],
                  ),
                ),
              ),
            ),
            //d /workout_home/workout_list/currentWorkoutGroupIndex
            Expanded(
              flex: 3,
              child: DashboardCard(
                customOntap: () {
                  if (WorkoutManager.currentWorkoutGroupIndex == null) return;
                  context.go(
                      '/workout_home/workout_list/${WorkoutManager.currentWorkoutGroupIndex}');
                },
                icon: Icon(
                  Icons.list,
                  size: Theme.of(context).textTheme.headlineSmall?.fontSize,
                  color: Theme.of(context).colorScheme.primaryContainer,
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
