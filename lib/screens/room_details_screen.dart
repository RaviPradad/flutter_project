import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ravikpradad/model/app_state.dart';
import 'package:ravikpradad/model/person_model.dart';

class RoomDetailScreen extends StatefulWidget {
  const RoomDetailScreen({super.key});

  @override
  State<RoomDetailScreen> createState() => _RoomDetailScreenState();
}

class _RoomDetailScreenState extends State<RoomDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 40, 10),
        title: const Text(
          "Details",
          style: TextStyle(color: Colors.pink, fontSize: 20),
        ),
      ),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (_, state) {
          // print("-=====>>>${state.room.length}");
          return ListView.builder(
              itemCount: state.room.length,
              itemBuilder: (context, index) {
                final List<Person> person = [
                  ...state.room[index].adults,
                  ...state.room[index].children
                ];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Room: ${state.room[index].roomNumber}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text("Adult: ${state.room[index].adults.length}"),
                        Text("Child: ${state.room[index].children.length}"),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: person.length,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: const EdgeInsets.all(14),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${index + 1}",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("Name: ${person[index].name}"),
                                    Text("Name: ${person[index].age}"),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                );
              });
        },
      ),
      // ListView.builder(
      //   itemCount: roomDataList.length,
      //   itemBuilder: (context, index) {
      //     Room roomData = roomDataList[index];
      //     return ListTile(
      //       title: Text("Room No: ${roomData.roomNumber}"),
      //       subtitle: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: <Widget>[
      //           Text("Adults:"),
      //           Column(
      //             children: roomData.adults.map((person) {
      //               return Text("${person.name}, Age: ${person.age}");
      //             }).toList(),
      //           ),
      //           Text("Children:"),
      //           Column(
      //             children: roomData.children.map((person) {
      //               return Text("${person.name}, Age: ${person.age}");
      //             }).toList(),
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
