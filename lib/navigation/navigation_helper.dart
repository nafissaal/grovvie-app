import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grovvie/education/course_page.dart';
import 'package:grovvie/education/education_page.dart';
import 'package:grovvie/growth_journal/start_journal.dart';
import 'package:grovvie/mindset_flashcard/flashcard_page.dart';
import 'package:grovvie/navigation/bottom_navigation_page.dart';

class NavigationHelper {
  static final NavigationHelper _instance = NavigationHelper._internal();

  static NavigationHelper get instance => _instance;

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> educationTabNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> flashcardTabNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> journalTabNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> profileTabNavigatorKey =
      GlobalKey<NavigatorState>();

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  static const String educationPath = '/education';
  static const String flashcardPath = '/flashcard';
  static const String journalPath = '/journal';
  static const String profilePath = '/profile';

  factory NavigationHelper() {
    return _instance;
  }

  NavigationHelper._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: educationTabNavigatorKey,
            routes: [
              GoRoute(
                path: educationPath,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const EducationPage(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: flashcardTabNavigatorKey,
            routes: [
              GoRoute(
                path: flashcardPath,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const FlashcardPage(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: journalTabNavigatorKey,
            routes: [
              GoRoute(
                path: journalPath,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const StartJournal(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: profileTabNavigatorKey,
            routes: [
              GoRoute(
                path: profilePath,
                pageBuilder: (context, state) {
                  return getPage(
                    child: ProfileScreen(
                      providers: const [],
                      appBar: AppBar(
                        title: const Text('Profil'),
                      ),
                      actions: [
                        SignedOutAction((context) {
                          context.pushReplacement(educationPath);
                        }),
                      ],
                    ),
                    state: state,
                  );
                },
              ),
            ],
          ),
        ],
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return getPage(
            child: BottomNavigationPage(
              child: navigationShell,
            ),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: '/sign-in',
        pageBuilder: (context, state) {
          return getPage(
            child: SignInScreen(
              headerBuilder: (context, constraints, shrinkOffset) {
                return Padding(
                  padding: const EdgeInsets.all(30),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset('assets/images/app-logo.png'),
                  ),
                );
              },
              subtitleBuilder: (context, action) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: action == AuthAction.signIn
                      ? const Text(
                          'Selamat datang di aplikasi Grovvie, silahkan login')
                      : const Text(
                          'Selamat datang di aplikasi Grovvie, silahkan buat akun'),
                );
              },
              actions: [
                ForgotPasswordAction(((context, email) {
                  final uri = Uri(
                    path: '/sign-in/forgot-password',
                    queryParameters: <String, String?>{
                      'email': email,
                    },
                  );
                  context.push(uri.toString());
                })),
                AuthStateChangeAction(
                  ((context, state) {
                    final user = switch (state) {
                      SignedIn state => state.user,
                      UserCreated state => state.credential.user,
                      _ => null
                    };
                    if (user == null) {
                      return;
                    }
                    if (state is UserCreated) {
                      user.updateDisplayName(user.email!.split('@')[0]);
                    }
                    if (!user.emailVerified) {
                      user.sendEmailVerification();
                      const snackBar = SnackBar(
                          content: Text(
                              'Silahkan periksa email untuk memverifikasi alamat email Anda'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    //here using condition

                    context.pushReplacement(educationPath);
                  }),
                ),
              ],
            ),
            state: state,
          );
        },
        routes: [
          GoRoute(
            path: 'forgot-password',
            builder: (context, state) {
              final arguments = state.uri.queryParameters;
              return ForgotPasswordScreen(
                email: arguments['email'],
                headerMaxExtent: 200,
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/courses/:id',
        pageBuilder: (context, state) {
          final courseId = state.pathParameters['id']!;
          return getPage(
            child: CoursePage(courseId: courseId),
            state: state,
          );
        },
      ),
    ];
    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: educationPath,
      routes: routes,
    );
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      child: child,
      key: state.pageKey,
    );
  }
}
