import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hms_sv_app/src/features/startup/presentation/startup_page.dart';
import 'package:hms_sv_app/src/global_provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Use when all widgets work with Material 3 https://github.com/flutter/flutter/issues/91605
        // useMaterial3: true,
        // appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
        primarySwatch: Colors.blue,
      ),
      home: const StartupApp(),
    );
  }
}

class StartupApp extends ConsumerWidget {
  const StartupApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateChanges = ref.watch(authStateChangesProvider);
    return authStateChanges.when(
        data: (user) {
          if (user != null) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () async =>
                          await ref.read(firebaseAuthProvider).signOut(),
                      icon: const Icon(Icons.close))
                ],
              ),
              body: const Center(
                child: Text("Llego al body :D"), // solo prueba :D
              ),
            );
          } else {
            return const Scaffold(body: StartupPage());
          }
        },
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        error: (error, _) => Center(
              child: Text(error.toString()),
            ) //ErrorPage(message: error.toString()),
        );
  }
}
