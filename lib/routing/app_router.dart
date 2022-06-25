import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/routing/not_found_screen.dart';
import 'package:lawyer_app/screens/dashbord/dashboard_screen.dart';
import 'package:lawyer_app/screens/main/main_screen.dart';

enum AppRoute {
  dashboard,
  definition,
  transaction,
  finance,
  reports,
  setting,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  //final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    // redirect: (state) {
    // return null;
    //},

    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.dashboard.name,
        builder: (context,state)=>MainScreen(),
      )
    ],

    errorBuilder: (context, state) => const NotFoundScreen(),
  );
});
