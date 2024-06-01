import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spoothi/Apis.dart';
import 'package:spoothi/Apis_perfomoinvoice.dart';

import 'lead.dart';

class dash extends StatefulWidget {
  const dash({super.key});

  @override
  State<dash> createState() => _dashState();
}

class _dashState extends State<dash> {
  var size,height,width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        // color: Colors.black26,
        child: Column(
          children: [
            Container(
              height: height/4,
              width: width/2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/spoothi.png"),fit: BoxFit.contain
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: GestureDetector(
                onTap: (){
                  Get.to(aps());
                },
                child: Container(
                  height: height/8,
                  width: width/1.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 5.0,
                            blurStyle: BlurStyle.solid


                        )
                      ]
                  ),
                  child: Center(child: Text("crm",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w600),))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GestureDetector(
                onTap: (){
                  Get.to(quot());
                },
                child: Container(
                  height: height/8,
                  width: width/1.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 5.0,
                            // offset: Offset(20,20),
                            blurStyle: BlurStyle.solid
                        )
                      ]
                  ),
                  child: Center(child: Text("Proforma Invoice",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w600),))),
                ),
              ),
            ),
            // DataTable(
            //     columns: [
            //       DataColumn(
            //         label: Text("fhgn ")),
            //       DataColumn(label: Text("gafgnd")),
            //       DataColumn(label: Text("gafgnd")),
            //     ],
            //     rows: [
            //       DataRow(
            //           cells: [
            //             DataCell(Text("GFN")),
            //             DataCell(Text("GFN")),
            //             DataCell(Text("GFN")),
            //           ])
            //     ])

          ],
        ),
      ),

    );
  }
}