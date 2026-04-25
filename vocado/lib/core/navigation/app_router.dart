import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/auth/presentation/pages/auth_feature_screen.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:vocado/features/task_creator/presentation/pages/task_creator_feature_screen.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_cubit.dart';
import 'package:vocado/features/task_viewer/presentation/pages/task_viewer_feature_screen.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';

import 'package:vocado/features/voice_task/presentation/pages/voice_task_feature_screen.dart';
import 'package:vocado/features/voice_task/presentation/cubit/voice_task_cubit.dart';

import 'package:vocado/features/splash/presentation/pages/splash_feature_screen.dart';
import 'package:vocado/features/bottom_nav/presentation/pages/bottom_nav_feature_screen.dart';
import 'package:vocado/features/bottom_nav/presentation/cubit/bottom_nav_cubit.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.voiceTask,

    routes: [
      GoRoute(
        path: Routes.auth,
        builder: (context, state) => BlocProvider(
          create: (context) => GetIt.I.get<AuthCubit>(),
          child: const AuthFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.taskViewer,
        builder: (context, state) => BlocProvider(
          create: (context) => TaskViewerCubit(GetIt.I.get()),
          child: const TaskViewerFeatureScreen(),
        ),
      ),


      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashFeatureScreen(),
      ),

      ShellRoute(
        builder: (context, state, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => BottomNavCubit(GetIt.I.get())),
              BlocProvider(create: (_) => TaskCreatorCubit(GetIt.I.get())),
            ],
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: Routes.bottomNav,
            builder: (context, state) => BottomNav(),
          ),

          GoRoute(
            path: Routes.taskCreator,
            builder: (context, state) => BlocProvider(
              create: (context) => TaskCreatorCubit(GetIt.I.get()),
              child: const AdminHomeScreen(),
            ),
          ),
        ],
      ),


      GoRoute(
        path: Routes.voiceTask,
        builder: (context, state) => BlocProvider(
          create: (context) => VoiceTaskCubit(GetIt.I.get()),
          child: const VoiceTaskFeatureScreen(),
        ),
      ),
    ],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
