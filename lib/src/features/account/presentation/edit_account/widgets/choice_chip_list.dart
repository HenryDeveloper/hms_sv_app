import 'package:flutter/material.dart';
import 'package:hms_sv_app/src/utils/helpers/gender_helper.dart';

class ChoiceChipList extends StatefulWidget {
  const ChoiceChipList({Key? key, this.selectedChip, this.onSelected})
      : super(key: key);

  final int? selectedChip;
  final void Function(int? value)? onSelected;

  @override
  State<ChoiceChipList> createState() => _ChoiceChipListState();
}

class _ChoiceChipListState extends State<ChoiceChipList> {
  int? value;
  @override
  void initState() {
    value = widget.selectedChip;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: List<Widget>.generate(
        GenderHelper.genderMap.length,
        (int index) {
          var gender = GenderHelper.genderMap.keys.elementAt(index);

          return ChoiceChip(
            label: Text(GenderHelper.genderMap[gender]!),
            selectedColor: Colors.blue,
            selected: value == index,
            onSelected: (bool selected) {
              if (value != null && value == index) {
                value = null;
              } else {
                value = selected ? index : null;
              }

              if (widget.onSelected != null) {
                widget.onSelected!(value);
              }

              setState(() {});
            },
          );
        },
      ).toList(),
    );
  }
}
