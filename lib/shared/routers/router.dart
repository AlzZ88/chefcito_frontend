import 'package:frontend_template/dashboard/screens/dashboard_analysis/dashboard_analysis.dart';
import 'package:frontend_template/dashboard/screens/dashboard_display/dashboard_display.dart';
import 'package:frontend_template/dashboard/screens/dashboard_home/dashboard_home.dart';
import 'package:frontend_template/shared/providers/my_auth_provider.dart';
import 'package:frontend_template/shared/screens/loading_screen.dart';
import 'package:frontend_template/shared/screens/login/login.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../home/screen/home.dart';

class AppRouter {
  final MyAuthProvider authProvider;

  AppRouter({required this.authProvider});

  GoRouter get router {
    return GoRouter(
        refreshListenable: authProvider,
        redirect: (context, state) {
          if (!authProvider.isLoggedIn && state.uri.toString() != '/login') {
            return '/login';
          } else if (authProvider.isLoggedIn &&
              state.uri.toString() == '/login') {
            return '/';
          }
          return null;
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            builder: (context, state) => const Home(),
            routes: <RouteBase>[
              GoRoute(
                path: 'loading', // Loading screen route
                builder: (context, state) => const LoadingScreen(),
              ),
              GoRoute(
                path: 'login',
                builder: (context, state) => const Login(),
              ),
              GoRoute(
                  path: 'dashboard',
                  builder: (context, state) => const DashboardHome(),
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'display',
                      builder: (context, state) => const DashboardDisplay(),
                    ),
                    GoRoute(
                      path: 'analysis',
                      builder: (context, state) => const DashboardAnalisys(),
                    ),
                  ]),
            ],
          ),
        ],
        initialLocation: "/login",
        errorBuilder: (context, state) {
          return Container(color: Colors.amber);
        });
  }
}
