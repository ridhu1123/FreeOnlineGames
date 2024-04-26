import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:playgames/screens/bottomnavigationscren/home.dart';
import 'package:playgames/screens/bottomnavigationscren/secondscreen.dart';
import 'dart:ui' as ui;
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  int _selectedIndex=0;

  List screens=[Home(),Secondscreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue.withOpacity(0.5),
      body: Stack(
        children: [
         
          screens[_selectedIndex],
        ],
      ),
      bottomNavigationBar:ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor:  Colors.black,
          unselectedItemColor: Colors.white,
          elevation: 0,
          selectedIconTheme: IconThemeData(size: 30,)
          
          ,items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.explore),label: "")
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: onitemindex,
        ),
      ) ,
    );
  }

  void onitemindex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
}
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:playgames/models/responce.dart';
// import 'package:playgames/services/apiclass.dart';

// class GameCategoriesPage extends StatefulWidget {
//   @override
//   _GameCategoriesPageState createState() => _GameCategoriesPageState();
// }

// class _GameCategoriesPageState extends State<GameCategoriesPage> {
//   List <Games>categories = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();

//   }
//   Future fetchData()async{
//     final responce=await Api().getData();
//     setState(() {
//       categories=responce;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Game Categories'),
//       ),
//       body: Center(
//         child: categories.isEmpty
//             ? CircularProgressIndicator()
//             : ListView.builder(
//                 itemCount: categories.length,
//                 itemBuilder: (context, index) {
//                   final item=categories[index];
//                   final name=item.name;
//                   final image=item.assets!.brick;
//                   final categorie=item.categories!.en.toString();
//                   return ListTile(
//                     title: Text(categorie),
//                     // leading: Image.network(image.toString()),
//                   );
//                 },
//               ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: GameCategoriesPage(),
//   ));
// }
