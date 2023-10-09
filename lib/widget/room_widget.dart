import 'package:flutter/material.dart';
import 'package:ravikpradad/widget/child_list_widget.dart';

import 'adult_list_widget.dart';

class RoomWidget extends StatefulWidget {
  const RoomWidget({
    super.key,
    required this.roomnumber,
    required this.childnumber,
    required this.adultnumber,
    required this.selectedRoomNumber,
    required this.adultnameRomControllerList,
    required this.adultAgeRomControllerList,
    required this.chidAgeRomControllerList,
    required this.chidnameRomControllerList,
    required this.numberCall,
  });
  final int roomnumber;
  final int childnumber;
  final int adultnumber;
  final int? selectedRoomNumber;
  final List<List<TextEditingController>> adultnameRomControllerList;
  final List<List<TextEditingController>> adultAgeRomControllerList;
  final List<List<TextEditingController>> chidAgeRomControllerList;
  final List<List<TextEditingController>> chidnameRomControllerList;
  final Function numberCall;

  @override
  State<RoomWidget> createState() => _RoomWidgetState();
}

class _RoomWidgetState extends State<RoomWidget> {
  int childnumber = 0;
  int adultnumber = 0;
  TextEditingController adultController = TextEditingController();
  TextEditingController childController = TextEditingController();
  @override
  dispose() {
    adultController.dispose();
    childController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Room ${widget.roomnumber + 1}",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color.fromARGB(255, 214, 211, 211),
                    ),
                    padding: const EdgeInsets.only(left: 4),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: adultController,
                      // onChanged: (value) {
                      //   adultnumber = int.tryParse(value)!;
                      // },
                      decoration: const InputDecoration(
                          hintText: "Enter Adult", border: InputBorder.none),
                    ),
                  )),
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                      child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color.fromARGB(255, 214, 211, 211),
                    ),
                    padding: const EdgeInsets.only(left: 4),
                    child: Center(
                      child: TextFormField(
                        controller: childController,
                        keyboardType: TextInputType.number,
                        // validator: (value) {
                        //   if (value == null ||
                        //       value.isEmpty) {
                        //     return "Enter no. of child";
                        //   }
                        //   return null;
                        // },
                        // onChanged: (value) {
                        //   childnumber = int.tryParse(value)!;
                        // },
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Child",
                            hintStyle: TextStyle()),
                      ),
                    ),
                  )),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    width: 80,
                    height: 36,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 22, 75, 25),
                          elevation: 0,

                          // padding: const EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                        ),
                        onPressed: () {
                          childnumber = childController.text.isEmpty
                              ? 0
                              : int.parse(childController.text);
                          adultnumber = adultController.text.isEmpty
                              ? 0
                              : int.parse(adultController.text);
                          print("tap");
                          if (childnumber == 0 && adultnumber == 0) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  title: Text("Please number of person "),
                                  content: Text("Person Detail"),
                                );
                              },
                            );
                            return;
                          }
                          widget.adultnameRomControllerList.clear();
                          widget.adultAgeRomControllerList.clear();
                          widget.chidAgeRomControllerList.clear();
                          widget.chidnameRomControllerList.clear();

                          for (int room = 0;
                              room < widget.selectedRoomNumber!;
                              room++) {
                            widget.adultnameRomControllerList.add([]);
                            widget.adultAgeRomControllerList.add([]);
                            widget.chidAgeRomControllerList.add([]);
                            widget.chidnameRomControllerList.add([]);

                            for (int i = 0; i < childnumber; i++) {
                              widget.chidAgeRomControllerList[room]
                                  .add(TextEditingController());
                              widget.chidnameRomControllerList[room]
                                  .add(TextEditingController());
                            }
                            for (int i = 0; i < adultnumber; i++) {
                              widget.adultnameRomControllerList[room]
                                  .add(TextEditingController());
                              widget.adultAgeRomControllerList[room]
                                  .add(TextEditingController());
                            }
                          }
                          widget.numberCall(childnumber, adultnumber);

                          setState(() {});
                        },
                        child: const Text(
                          "ADD",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              /// Adult
              AdultListWidget(
                  roomnumer: widget.roomnumber,
                  adultnumber: adultnumber,
                  adultAgeRomControllerList: widget.adultAgeRomControllerList,
                  adultnameRomControllerList:
                      widget.adultnameRomControllerList),
              const SizedBox(
                height: 10,
              ),

              /// Child
              ChildListWidget(
                  childnumber: childnumber,
                  roomnumer: widget.roomnumber,
                  chidnameRomControllerList: widget.chidnameRomControllerList,
                  chidAgeRomControllerList: widget.chidAgeRomControllerList),
            ],
          ),
        ),
      ),
    );
  }
}
