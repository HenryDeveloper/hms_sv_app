import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hms_sv_app/src/global_provider.dart';

class ViewAccountPage extends StatelessWidget {
  const ViewAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 65,
                    backgroundImage: NetworkImage(
                        "https://m.media-amazon.com/images/I/71qApJHME8L._AC_SX679_.jpg"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      return const Text(
                        "Saitama sensei",
                        style: TextStyle(fontSize: 30),
                      );
                    },
                  )
                ],
              )),
          Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const ListTile(
                  leading: Icon(Icons.edit),
                  title: Text("Editar Perfil"),
                ),
                const ListTile(
                  leading: Icon(Icons.password),
                  title: Text("Cambiar Password"),
                ),
                const ListTile(
                  leading: Icon(Icons.home_outlined),
                  title: Text("Mis Propiedades"),
                ),
                Consumer(builder: (context, ref, child) {
                  return ListTile(
                    leading: const Icon(Icons.output),
                    title: const Text("Salir"),
                    onTap: () => ref.watch(firebaseAuthProvider).signOut(),
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
