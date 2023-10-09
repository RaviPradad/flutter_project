import 'package:flutter/material.dart';
import 'package:ravikpradad/widget/person_info_widget.dart';

class ChildListWidget extends StatelessWidget {
  const ChildListWidget({
    super.key,
    required this.childnumber,
    required this.chidnameRomControllerList,
    required this.chidAgeRomControllerList,
    required this.roomnumer,
  });
  final int roomnumer;
  final int childnumber;
  final List<List<TextEditingController>> chidnameRomControllerList;
  final List<List<TextEditingController>> chidAgeRomControllerList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: childnumber,
      itemBuilder: (context, index) {
        // chidnameRomControllerList[roomnum]
        //     .add(TextEditingController());
        // chidAgeRomControllerList[roomnum]
        //     .add(TextEditingController());

        return PersonInfoWidget(
          roomnumber: 2,
          nameController: chidnameRomControllerList[roomnumer][index],
          ageController: chidAgeRomControllerList[roomnumer][index],
          personType: "Child",
        );
      },
    );
  }
}
