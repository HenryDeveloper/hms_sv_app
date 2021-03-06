import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hms_sv_app/src/constants/strings.dart';
import 'package:hms_sv_app/src/features/account/presentation/edit_account/widgets/choice_chip_list.dart';
import 'package:hms_sv_app/src/global_provider.dart';

class EditAccountPage extends ConsumerStatefulWidget {
  const EditAccountPage({Key? key}) : super(key: key);

  @override
  ConsumerState<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends ConsumerState<EditAccountPage> {
  @override
  Widget build(BuildContext context) {
    var getProfile = ref.watch(getProfileProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.editProfileText),
        ),
        body: getProfile.when(
            data: (profile) => SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      initialValue: profile.firstName,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.badge_outlined),
                        labelText: Strings.nameTextFormFieldText,
                      ),
                    ),
                    TextFormField(
                      initialValue: profile.lastName,
                      //controller: surnameTextEditingController,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      //validator: _validateValue,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.badge_outlined),
                        labelText: Strings.surnameTextFormFieldText,
                      ),
                    ),
                    TextFormField(
                      initialValue: profile.phoneNumber,
                      //controller: surnameTextEditingController,
                      keyboardType: TextInputType.phone,
                      textCapitalization: TextCapitalization.words,
                      //validator: _validateValue,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.phone),
                        labelText: Strings.phoneNumberTextFormFieldText,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      Strings.genderText,
                    ),
                    ChoiceChipList(
                      selectedChip: profile.gender?.index,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50)),
                        onPressed: () => {},
                        child: const Text(Strings.updateButtonText))
                  ],
                ))),
            error: (error, _) => Center(
                  child: Text(error.toString()),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
