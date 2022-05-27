import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hms_sv_app/src/features/auth/presentation/sign_in/sign_in_page.dart';
import 'package:hms_sv_app/src/global_provider.dart';
import 'package:hms_sv_app/src/routing/app_router.dart';

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
      initialRoute: AppRoutes.startupPage,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}

class StartupPage extends ConsumerWidget {
  const StartupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateChanges = ref.watch(authStateChangesProvider);
    return authStateChanges.when(
        data: (user) {
          if (user != null) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Bienvenido ${user.displayName}"),
                actions: [
                  CloseButton(
                    onPressed: () async =>
                        await ref.read(firebaseAuthProvider).signOut(),
                  )
                ],
              ),
              body: const Center(
                child: Text("Llego al body :D"), // solo prueba :D
              ),
            );
          } else {
            return const Scaffold(body: SignInPage());
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
