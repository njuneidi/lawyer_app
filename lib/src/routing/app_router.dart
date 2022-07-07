import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:lawyer_app/src/features/authentication/presentation/sign_in/email_password_sign_in_screen.dart';
import 'package:lawyer_app/src/features/authentication/presentation/sign_in/email_password_sign_in_state.dart';
import 'package:lawyer_app/src/routing/not_found_screen.dart';
//import 'package:lawyer_app/src/screens/definition/definition_screen.dart';
import 'package:lawyer_app/src/screens/main/main_screen.dart';
import 'package:lawyer_app/src/screens/side_menu_items.dart';
//import 'package:lawyer_app/src/screens/transaction/transaction_screen.dart';

enum AppRoute {
  root,
  home,
  dashboard,
  definition,
  transaction,
  finance,
  reports,
  setting,
  signIn,
  user,
  account
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
 
 
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (state) {
      final isLoggedIn = authRepository.currentUser != null;
      debugPrint(isLoggedIn == true ? " isLoggedIn true" : "isLoggedIn false");
      debugPrint(state.location);
      if (isLoggedIn) {
        if (state.location == '/signIn') {
          return '/';
        }
      } else {
        if (state.location != '/signIn') {
          return null;
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      
      GoRoute(
        path: '/',
        name: AppRoute.root.name,
        //redirect: (_) => '/root/dashboard',
        builder: (context, state) => MainScreen(tab: ''),
       // builder: (context, state) => MainScreen(tab: 'dashboard'),
        routes: [
          GoRoute(
            path: 'dashboard',
            name: AppRoute.dashboard.name,
            //builder: (context, state) => MainScreen(tab: 'dashboard'),
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child:  MainScreen(
                tab: 'dashboard',
              ),
            ),
          ),
          GoRoute(
            path: 'definition',
            name: AppRoute.definition.name,
           // builder: (context, state) => MainScreen(tab: 'definition'),
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child:  MainScreen(
                tab: 'definition',
              ),
            ),
          ),
          GoRoute(
            path: 'transaction',
            name: AppRoute.transaction.name,
            //builder: (context, state) => MainScreen(tab: 'dashboard'),
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child:  MainScreen(
                tab: 'transaction',
              ),
            ),
          ),
          GoRoute(
            path: 'finance',
            name: AppRoute.finance.name,
           // builder: (context, state) => MainScreen(tab: 'definition'),
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child:  MainScreen(
                tab: 'finance',
              ),
            ),
          ),
          GoRoute(
            path: 'reports',
            name: AppRoute.reports.name,
           // builder: (context, state) => MainScreen(tab: 'definition'),
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child:  MainScreen(
                tab: 'reports',
              ),
            ),
          ),
          GoRoute(
            path: 'settings',
            name: AppRoute.setting.name,
           // builder: (context, state) => MainScreen(tab: 'definition'),
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child:  MainScreen(
                tab: 'settings',
              ),
            ),
          ),
           GoRoute(
            path: 'signIn',
            name: AppRoute.signIn.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const EmailPasswordSignInScreen(
                formType: EmailPasswordSignInFormType.signIn,
              ),
            ),
          ),
          
         
         
        ],
      ),

      // GoRoute(
      //   path: '/definition',
      //   name: AppRoute.definition.name,
      //   builder: (context, state) =>  MainScreen(tab: 'definition',),
      //   //  pageBuilder: (context, state) => MaterialPage(
      //   //       key: state.pageKey,
      //   //       fullscreenDialog: true,
      //   //       child:  MainScreen(tab: 'definition',),
      //   //       ),

      //   routes: [],
      // ),
      //GoRoute(
      //   path: 'transaction',
      //   name: AppRoute.transaction.name,
      //  // builder: (context, state) =>  MainScreen(tab: 'transaction',),
      //    pageBuilder: (context, state) => MaterialPage(
      //         key: state.pageKey,
      //         fullscreenDialog: true,
      //         child:  MainScreen(tab: 'transaction',),
      //         ),

      //   routes: [],
      // ),
      // GoRoute(
      //   path: 'finance',
      //   name: AppRoute.finance.name,
      //  // builder: (context, state) =>  MainScreen(tab: 'finance',),
      //    pageBuilder: (context, state) => MaterialPage(
      //         key: state.pageKey,
      //         fullscreenDialog: true,
      //         child:  MainScreen(tab: 'finance',),
      //         ),

      //   routes: [],
      // ),
      // GoRoute(
      //   path: 'reports',
      //   name: AppRoute.reports.name,
      //  // builder: (context, state) =>  MainScreen(tab: 'reports',),
      //    pageBuilder: (context, state) => MaterialPage(
      //         key: state.pageKey,
      //         fullscreenDialog: true,
      //         child:  MainScreen(tab: 'reports',),
      //         ),

      //   routes: [],
      // ),
      // GoRoute(
      //   path: 'setting',
      //   name: AppRoute.setting.name,
      //  // builder: (context, state) =>  MainScreen(tab: 'setting',),
      //    pageBuilder: (context, state) => MaterialPage(
      //         key: state.pageKey,
      //         fullscreenDialog: true,
      //         child:  MainScreen(tab: 'setting',),
      //         ),

      //   routes: [],
      // ),
      // GoRoute(
      //       path: 'signIn',
      //       name: AppRoute.signIn.name,
      //       pageBuilder: (context, state) => MaterialPage(
      //         key: state.pageKey,
      //         fullscreenDialog: true,
      //         child: const EmailPasswordSignInScreen(
      //           formType: EmailPasswordSignInFormType.signIn,
      //         ),
      //       ),
      //     ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
});
