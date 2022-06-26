import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hms_sv_app/src/constants/strings.dart';
import 'package:hms_sv_app/src/global_provider.dart';
import 'package:hms_sv_app/src/routing/app_router.dart';

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
                  CachedNetworkImage(
                    imageUrl:
                        'https://m.media-amazon.com/images/I/71qApJHME8L._AC_SX679_.jpg',
                    placeholder: (context, url) => const CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 65,
                    ),
                    imageBuilder: (context, image) => CircleAvatar(
                      backgroundImage: image,
                      radius: 65,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      var displayName = ref.watch(userStateChangesProvider
                          .select((value) => value.asData?.value?.displayName));

                      return Text(
                        displayName?.replaceAll("-", " ") ?? "My Profile",
                        style: const TextStyle(fontSize: 30),
                      );
                    },
                  )
                ],
              )),
          Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text(Strings.editProfileText),
                  onTap: () async => await Navigator.pushNamed(
                      context, AppRoutes.updateAccountPage),
                ),
                const ListTile(
                  leading: Icon(Icons.password),
                  title: Text(Strings.changePasswordText),
                ),
                const ListTile(
                  leading: Icon(Icons.home_outlined),
                  title: Text(Strings.myPropertiesText),
                ),
                Consumer(builder: (context, ref, child) {
                  return ListTile(
                    leading: const Icon(Icons.output),
                    title: const Text(Strings.logOutText),
                    onTap: () => ref.read(firebaseAuthProvider).signOut(),
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
