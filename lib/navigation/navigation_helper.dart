import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grovvie/application_state.dart';
import 'package:grovvie/education/course_page.dart';
import 'package:grovvie/education/education_page.dart';
import 'package:grovvie/education/model/course_model.dart';
import 'package:grovvie/growth_journal/start_journal.dart';
import 'package:grovvie/mindset_flashcard/flashcard_page.dart';
import 'package:grovvie/mindset_flashcard/quiz_page.dart';
import 'package:grovvie/navigation/bottom_navigation_page.dart';
import 'package:provider/provider.dart';

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

  static const String coursePath = '/courses/:courseId';
  static const String quizPath = '/quiz';

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
                builder: (context, state) {
                  return Consumer<ApplicationState>(
                      builder: (context, appState, _) {
                    if (appState.currentUser == null) {
                      return const Center(
                        child: Text('Silahkan login terlebih dahulu'),
                      );
                    }
                    return ProfileScreen(
                      key: ValueKey(appState.emailVerified),
                      providers: const [],
                      appBar: AppBar(
                        title: const Text('Profil'),
                      ),
                      actions: [
                        SignedOutAction(
                          ((context) {
                            context.go(educationPath);
                          }),
                        ),
                      ],
                      children: [
                        Visibility(
                          visible: !appState.emailVerified,
                          child: OutlinedButton(
                            child:
                                const Text('Periksa kembali status verifikasi'),
                            onPressed: () {
                              appState.refreshLoggedInUser();
                            },
                          ),
                        ),
                      ],
                    );
                  });
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
        path: '/sign-in',
        builder: (context, state) {
          return SignInScreen(
            headerBuilder: (context, constraints, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(30),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network('https://firebasestorage.googleapis.com/v0/b/grovvie.appspot.com/o/app-logo.png?alt=media&token=cb6bdf88-314c-4881-9bb0-194b351a0c6f'),
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
                          'Silahkan periksa email untuk memverifikasi alamat email Anda'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  context.go(educationPath);
                }),
              ),
            ],
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
        path: coursePath,
        builder: (context, state) {
          final courseId = state.pathParameters['courseId'];
          if (courseId == null) {
            return const Center(child: Text('Course ID tidak ditemukan'));
          }

          return FutureBuilder<CourseContent?>(
            future: CourseContent.fromFirestore(courseId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data == null) {
                return const Scaffold(
                  body: Center(
                    child: Text('Data tidak ditemukan'),
                  ),
                );
              } else {
                return CoursePage(content: snapshot.data!);
              }
            },
          );
        },
      ),
      GoRoute(
        path: quizPath,
        pageBuilder: (context, state) {
          return getPage(
            child: const QuizPage(),
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
