import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hms_sv_app/src/constants/strings.dart';

class EditAccountPage extends ConsumerStatefulWidget {
  const EditAccountPage({Key? key}) : super(key: key);

  @override
  ConsumerState<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends ConsumerState<EditAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.editProfileText),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(10), child: Column()),
    );
  }
}
