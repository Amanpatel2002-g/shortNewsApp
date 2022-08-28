// import 'dart:ffi';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class HomePage extends StatefulWidget {
//   HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   var _selectedIndex = 0.obs;


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         bottomNavigationBar: (BottomNavigationBar(
//           selectedItemColor: Colors.red,
//           unselectedItemColor: Colors.blue,
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: "person"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.newspaper), label: "person"),
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: "person"),
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: "person"),
//           ],
//           onTap: (x) {
//             setState(() {
//               _selectedIndex.value = x;
//             });
//           },
//           // currentIndex: Obx((){
//           //   return _selectedIndex.value;
//           // }),
//         )),
//         body: Center(child: Text("This is index ${_selectedIndex}")));
//   }
// }
