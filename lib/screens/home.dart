import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ravikpradad/screens/room_details_screen.dart';
import 'package:redux/redux.dart';

import '../action/app_action.dart';
import '../model/app_state.dart';
import '../model/person_model.dart';
import '../model/room_model.dart';
import '../widget/room_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? selectedRoomNumber = 0;
  List<List<TextEditingController>> adultnameRomControllerList = [];
  List<List<TextEditingController>> adultAgeRomControllerList = [];
  List<List<TextEditingController>> chidnameRomControllerList = [];
  List<List<TextEditingController>> chidAgeRomControllerList = [];

  String selectedRoom = 'Select Room';
  bool isDropdownOpen = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int childnumber = 0;
  int adultnumber = 0;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store>(
      converter: (store) => store,
      builder: (_, store) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 4, 40, 10),
            title: const Text(
              "Home",
              style: TextStyle(color: Colors.pink, fontSize: 20),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Room",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: toggleDropdown,
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  //     decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.grey),
                  //       borderRadius: BorderRadius.circular(4.0),
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: <Widget>[
                  //         Text(
                  //           selectedRoom,
                  //           style: TextStyle(fontSize: 18),
                  //         ),
                  //         Icon(
                  //           isDropdownOpen
                  //               ? Icons.keyboard_arrow_up
                  //               : Icons.keyboard_arrow_down,
                  //           size: 24,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // if (isDropdownOpen)
                  //   DropdownButton<String>(
                  //     value: selectedRoom,
                  //     items: ['Room 1', 'Room 2', 'Room 3', 'Room 4', 'Room 5']
                  //         .map((String room) {
                  //       return DropdownMenuItem<String>(
                  //         value: room,
                  //         child: Text(room),
                  //       );
                  //     }).toList(),
                  //     onChanged: (String? newValue) {
                  //       selectRoom(newValue!);
                  //     },
                  //   ),
                  /// Selectd room
                  Container(
                    // width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color.fromARGB(255, 231, 226, 226),
                    ),
                    padding: const EdgeInsets.only(left: 6),

                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        isExpanded: true,
                        icon: Row(
                          children: [
                            const Text(
                              "|",
                              style: TextStyle(fontSize: 22),
                            ),
                            Icon(
                              isDropdownOpen
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              size: 24,
                            ),
                          ],
                        ),
                        value: selectedRoomNumber,
                        onChanged: (int? newValue) {
                          if (newValue == null) return;

                          setState(() {
                            selectedRoomNumber = newValue;
                          });
                        },
                        items: [0, 1, 2, 3, 4, 5].map<DropdownMenuItem<int>>(
                          (int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: (value == 0)
                                  ? const Text("Select Room")
                                  : Text("Room $value"),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: selectedRoomNumber,
                        itemBuilder: (context, roomnum) {
                          return RoomWidget(
                              numberCall: numerCall,
                              roomnumber: roomnum,
                              childnumber: childnumber,
                              adultnumber: adultnumber,
                              selectedRoomNumber: selectedRoomNumber,
                              adultnameRomControllerList:
                                  adultnameRomControllerList,
                              adultAgeRomControllerList:
                                  adultAgeRomControllerList,
                              chidAgeRomControllerList:
                                  chidAgeRomControllerList,
                              chidnameRomControllerList:
                                  chidnameRomControllerList);
                        }),
                  ),

                  ///Button--->>
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 239, 33, 102),
                          // padding: const EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        onPressed: () {
                          // print("${_formKey.currentState!.validate()}");
                          _formKey.currentState!.validate();
                          _submitData(store);
                          // _submitData(store);
                        },
                        child: const Text(
                          "SUBMIT",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void numerCall(int child, int adult) {
    childnumber = child;
    adultnumber = adult;

    setState(() {});
  }

  void showDialogValid() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("Enter required "),
          content: Text("Person Detail"),
        );
      },
    );
  }

  void _submitData(Store store) {
    bool isSomthingWrong = false;
    if (selectedRoomNumber == 0) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Please fill room form"),
            content: Text("Person Detail"),
          );
        },
      );
      return;
    }

    if (adultnameRomControllerList.isEmpty && childnumber == 0) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Please enter no. child or adult"),
            content: Text("Person Detail"),
          );
        },
      );
      return;
    }
    if (!_formKey.currentState!.validate()) return;

    // print(
    //     "adultnameRomControllerList${_formKey.currentState!.validate()} : ${adultnameRomControllerList.length}");

    for (int roomnum = 0;
        roomnum < adultnameRomControllerList.length;
        roomnum++) {
      List<Person> adults = [];
      List<Person> children = [];
      // if (adultnameRomControllerList[roomnum].isEmpty ||
      //     chidnameRomControllerList[roomnum].isEmpty) {
      //   // print("===========>>>>>Something");
      //   isSomthingWrong = true;
      //   break;
      // }

      for (int namenum = 0;
          namenum < adultnameRomControllerList[roomnum].length;
          namenum++) {
        // print("==>>>${adultAgeRomControllerList[roomnum][namenum].text}");
        // if (adultnameRomControllerList[roomnum][namenum].text.isEmpty ||
        //     adultAgeRomControllerList[roomnum][namenum].text.isEmpty) {
        //   showDialogValid();
        //   return;
        // }
        if (adultnameRomControllerList[roomnum][namenum].text.isNotEmpty) {
          adults.add(
            Person(
              name: adultnameRomControllerList[roomnum][namenum].text,
              age: adultAgeRomControllerList[roomnum][namenum].text,
            ),
          );
        }
        adultnameRomControllerList[roomnum][namenum].clear();
        adultAgeRomControllerList[roomnum][namenum].clear();
      }
      // print("==>>>2>>${chidAgeRomControllerList.length}");
      // print("==>>>3>>${chidAgeRomControllerList[roomnum].length}");
      for (int namenum = 0;
          namenum < chidAgeRomControllerList[roomnum].length;
          namenum++) {
        // print("==>>>2>>${adultnameRomControllerList[roomnum][namenum].text}");
        // if (chidAgeRomControllerList[roomnum][namenum].text.isEmpty ||
        //     chidAgeRomControllerList[roomnum][namenum].text.isEmpty) {
        //   showDialogValid();
        //   return;
        // }
        if (chidnameRomControllerList[roomnum][namenum].text.isNotEmpty) {
          children.add(
            Person(
              name: chidnameRomControllerList[roomnum][namenum].text,
              age: chidAgeRomControllerList[roomnum][namenum].text,
            ),
          );
        }
        chidnameRomControllerList[roomnum][namenum].clear();
        chidAgeRomControllerList[roomnum][namenum].clear();
      }

      // print("final: ${adults.isNotEmpty} , ${children.isNotEmpty}");

      if (adults.isNotEmpty || children.isNotEmpty) {
        store.dispatch(RoomDetailAction(
            Room(roomNumber: roomnum + 1, adults: adults, children: children)));
      }
    }
    // if (isSomthingWrong) {
    //   // print("Something");
    //   showDialog(
    //     context: context,
    //     builder: (context) {
    //       return const AlertDialog(
    //         title: Text("Enter required "),
    //         content: Text("Person Detail"),
    //       );
    //     },
    //   );
    //   return;
    // }
    selectedRoomNumber = 0;

    //   return;
    // }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoomDetailScreen(),
      ),
    );
  }
}
