import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hms_sv_app/src/global_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final List<BottomNavigationBarItem> items = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Inicio"),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
    const BottomNavigationBarItem(icon: Icon(Icons.info), label: "Ordenes"),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
  ];

  static const List<Widget> _pages = <Widget>[
    Icon(Icons.logo_dev),
    Icon(Icons.flutter_dash),
    Icon(Icons.logo_dev),
    Icon(Icons.logo_dev_sharp)
  ];

  late int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    _selectedIndex = ref.watch(selectedIndexProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          CloseButton(
            onPressed: () => ref.watch(firebaseAuthProvider).signOut(),
          )
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        items: items,
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (_selectedIndex == index) return;

          ref
              .read(selectedIndexProvider.notifier)
              .update((state) => state = index);
        },
      ),
    );
  }
}
