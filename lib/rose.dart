import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ros extends StatefulWidget {
  const ros({super.key});

  @override
  State<ros> createState() => _rosState();
}

class _rosState extends State<ros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.pink,
      body: Center(
        child: Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.white10,
            child: Container(
              height: 200,
              width: 400,
             child: ClipRRect(
               borderRadius: BorderRadius.circular(8.0),
               child: Image.asset(
                 "assets/spoothi.png",
                 fit: BoxFit.fill,
               ),
             ),
             ),
      ),
    )
    );
  }
}
