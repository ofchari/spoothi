import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spoothi/clip%20path.dart';
import 'package:spoothi/dashboard.dart';
import 'package:spoothi/lead.dart';
import 'package:spoothi/main.dart';
import 'package:spoothi/rose.dart';
import 'package:spoothi/sample.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:spoothi/yellow.dart';

import 'light_blue.dart';

class nav extends StatefulWidget {
  const nav({super.key});

  @override
  State<nav> createState() => _navState();
}

class _navState extends State<nav> {
   int currentindex = 0;

   final pages = [
     dash(),
     ros(),
     clip(),
     ExpandableFabExample(),
   ];

   void krish(index){
     setState(() {
       currentindex = index;
     });
   }
  @override
  Widget build(BuildContext context) {
     List<Color> _Colorslis = [
       Colors.purple,
       Colors.pink,
       Colors.orange,
       Colors.teal
     ];
    return Scaffold(
      // extendBody: true,
      body: pages[currentindex],
      bottomNavigationBar: AnimatedNotchBottomBar(
        color: Colors.blue,
          durationInMilliSeconds: 500,
          notchBottomBarController: NotchBottomBarController(
            index: currentindex
          ),
          bottomBarItems: [
            BottomBarItem(
                inActiveItem: Icon(Icons.home),
                activeItem: Icon(Icons.home,color: Colors.blue,),
                itemLabel: "Home",
            ),
            BottomBarItem(
                inActiveItem: Icon(Icons.production_quantity_limits),
                activeItem: Icon(Icons.production_quantity_limits,color: Colors.blue,),
                itemLabel: "Product"
            ),
            BottomBarItem(
                inActiveItem: Icon(Icons.shopping_bag_outlined),
                activeItem: Icon(Icons.shopping_bag_outlined,color: Colors.blue,),
                itemLabel: "Cart"
            ),
            BottomBarItem(
                inActiveItem: Icon(Icons.person),
                activeItem: Icon(Icons.person,color: Colors.blue,),
                itemLabel: "person"
            ),
          ],
          onTap: krish,
          kIconSize: 24,
          kBottomRadius: 28
      ),
    );
  }
// Salmon bottom bar //
// pages[currentindex],
// bottomNavigationBar: SalomonBottomBar(
//     backgroundColor: Colors.white,
//     selectedItemColor: Color(_Colorslis.length),
//     // itemShape: const StarBorder(),
//     curve: Curves.easeInOutSine,
//     currentIndex: currentindex,
//     onTap: krish,
//     items: [
//       SalomonBottomBarItem(
//         icon: Icon(Icons.home),
//         title: Text("Home",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),),
//         selectedColor: Colors.purple,
//       ),
//
//       /// Likes
//       SalomonBottomBarItem(
//         icon: Icon(Icons.favorite_border),
//         title: Text("Likes",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),),
//         selectedColor: Colors.pink,
//       ),
//
//       /// Search
//       SalomonBottomBarItem(
//         icon: Icon(Icons.search),
//         title: Text("Search",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),),
//         selectedColor: Colors.orange,
//       ),
//
//       /// Profile
//       SalomonBottomBarItem(
//         icon: Icon(Icons.person),
//         title: Text("Profile",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),),
//         selectedColor: Colors.teal,
//       ),
//     ]
// ),



// dot navigation bar //
// pages[currentindex],
// bottomNavigationBar: SizedBox(
//   height: 130,
//   child: DotNavigationBar(
//     selectedItemColor: Colors.yellow,
//     backgroundColor: Colors.black,
//     borderRadius: 60,
//     dotIndicatorColor: Colors.blueGrey,
//     currentIndex: currentindex,
//     onTap: krish,
//       items: [
//         DotNavigationBarItem(
//             icon: Icon(Icons.home,color: Colors.white,)
//         ),
//         DotNavigationBarItem(
//             icon: Icon(Icons.production_quantity_limits,color: Colors.blueGrey,)
//         ),
//         DotNavigationBarItem(
//             icon: Icon(Icons.shopping_bag_outlined,color: Colors.green,)
//         ),
//         DotNavigationBarItem(
//             icon: Icon(Icons.navigation_outlined,color: Colors.purple,)
//         ),
//       ]),
// ),
}
