import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workouttrackergwanak/animation_practice_widget.dart';
import 'package:workouttrackergwanak/frame_page.dart';
import 'package:workouttrackergwanak/landing_page.dart';
import 'package:workouttrackergwanak/login_page.dart';
import 'package:workouttrackergwanak/settings_page.dart';
import 'package:workouttrackergwanak/workout_guide_page.dart';
import 'package:workouttrackergwanak/workout_home_page.dart';
import 'package:workouttrackergwanak/workout_list_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _homeNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'home');
final GlobalKey<NavigatorState> _settingsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'setting');
// GoRouter configuration
// 라우터는 글로벌 변수로 만들어도 괜찮음. >> _ 지움..
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      // builder: (context, state) => LandingPage(),
      builder: (context, state) => AnimationPracticeWidget(),
    ),
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state, navigationShell) {
        return FramePage(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              path: '/workout_home',
              builder: (context, state) {
                return WorkoutHomePage();
              },
              routes: [
                GoRoute(
                  path: 'workout_list/:group_index',
                  builder: (context, state) {
                    String? groupIndexString =
                        state.pathParameters['group_index'];
                    final groupIndex = int.parse(groupIndexString!);
                    return WorkoutListPage(groupIndex: groupIndex);
                  },
                  routes: [
                    GoRoute(
                      path: 'workout_guide/:workouts_index',
                      builder: (context, state) {
                        String? workoutsIndexString =
                            state.pathParameters['workouts_index'];
                        final workoutsIndex = int.parse(workoutsIndexString!);

                        String? groupIndexString =
                            state.pathParameters['group_index'];
                        final groupIndex = int.parse(groupIndexString!);

                        return WorkoutGuidePage(
                            workoutsIndex: workoutsIndex,
                            groupIndex: groupIndex);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _settingsNavigatorKey,
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) {
                return SettingsPage();
              },
              routes: [
                GoRoute(
                  path: 'login',
                  builder: (context, state) {
                    return LoginPage();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    // StatefulShellRoute.indexedStack(
    //   branches: [
    //     StatefulShellBranch(
    //       navigatorKey: _settingNavigatorKey,
    //       routes: [
    //         GoRoute(
    //           path: '/settings',
    //           builder: (context, state) {
    //             return SettingsPage();
    //           },
    //           routes: [
    //             GoRoute(
    //               path: 'login',
    //               builder: (context, state) {
    //                 return LoginPage();
    //               },
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
  ],
);
