import 'package:flutter/material.dart';

class PersonInfoWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController ageController;
  final int roomnumber;
  final String personType;

  PersonInfoWidget({
    super.key,
    required this.personType,
    required this.nameController,
    required this.ageController,
    required this.roomnumber,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              personType,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.only(left: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color.fromARGB(255, 214, 211, 211),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 2) {
                          return "Enter valid name";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Name",
                          errorStyle: TextStyle(
                            height: 0.01,
                            fontSize: 8,
                          ),
                          hintStyle: TextStyle()),
                      onSaved: (value) {},
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.only(left: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color.fromARGB(255, 214, 211, 211),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter valid age";
                        } else if (personType == "Adult" &&
                            int.parse(value) < 18) {
                          return "Enter valid age";
                        } else if (personType == "Child" &&
                            int.parse(value) > 18) {
                          return "Enter valid age";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: ageController,
                      decoration: const InputDecoration(
                          errorStyle: TextStyle(
                            height: 0.01,
                            fontSize: 8,
                          ),
                          border: InputBorder.none,
                          hintText: "Enter Age",
                          hintStyle: TextStyle()),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void saveFunction() {
    if (nameController.text.isEmpty || nameController.text.length < 3)

      /// Fill ener valid form for name

      return;

    /// age cheking

    if (ageController.text.isEmpty || int.parse(ageController.text) < 18)

      /// Enter valid age
      return;
  }
}
