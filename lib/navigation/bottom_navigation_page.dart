import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grovvie/application_state.dart';
import 'package:provider/provider.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({
    super.key,
    required this.child,
  });

  final StatefulNavigationShell child;

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  @override
  Widget build(BuildContext context) {
    final appState =
        context.watch<ApplicationState>(); 

    return Scaffold(
      body: SafeArea(
        child: widget.child,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.child.currentIndex,
        onDestinationSelected: (index) {
          if ((index == 2 || index == 3) && !appState.loggedIn) {
            context.push('/sign-in');
          } else {
            widget.child.goBranch(
              index,
              initialLocation: index == widget.child.currentIndex,
            );
          }
          setState(() {});
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.play_lesson_outlined),
            label: 'Edukasi',
          ),
          NavigationDestination(
            icon: Icon(Icons.credit_card),
            label: 'Flashcard',
          ),
          NavigationDestination(
            icon: Icon(Icons.library_books_outlined),
            label: 'Jurnal',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
