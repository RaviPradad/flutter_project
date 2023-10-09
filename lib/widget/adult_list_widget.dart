import 'package:flutter/material.dart';
import 'package:ravikpradad/widget/person_info_widget.dart';

class AdultListWidget extends StatelessWidget {
  const AdultListWidget({
    super.key,
    required this.adultnumber,
    required this.adultAgeRomControllerList,
    required this.adultnameRomControllerList,
    required this.roomnumer,
  });
  final int roomnumer;
  final int adultnumber;
  final List<List<TextEditingController>> adultAgeRomControllerList;
  final List<List<TextEditingController>> adultnameRomControllerList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: adultnumber,
      itemBuilder: (context, index) {
        // adultnameRomControllerList[roomnum]
        //     .add(TextEditingController());
        // adultAgeRomControllerList[roomnum]
        //     .add(TextEditingController());
        // // adultnameController
        //     .add(TextEditingController());
        // adultAgeController
        //     .add(TextEditingController());

        return PersonInfoWidget(
          roomnumber: index,
          personType: "Adult",
          ageController: adultAgeRomControllerList[roomnumer][index],
          nameController: adultnameRomControllerList[roomnumer][index],
        );
      },
    );
  }
}
