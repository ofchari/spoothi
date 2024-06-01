import 'dart:convert';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/io_client.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spoothi/lead.dart';

import 'model/sporthii_api.dart';

class aps extends StatefulWidget {
  const aps({super.key});

  @override
  State<aps> createState() => _apsState();
}

class _apsState extends State<aps> {
  Future< List<Data>> fetch() async{
    HttpClient client = new HttpClient();
    client.badCertificateCallback =
    ((X509Certificate cert, String host, int port) => true);
    IOClient ioClient = new IOClient(client);
    var a = await ioClient.get(Uri.parse('https://demo.regenterp.com/api/resource/Lead?fields=["name","company_name","lead_name","mobile_no","status"]&limit_page_length=5000'),headers: {"Authorization":"token 6d2ca3be092e460:f3628df3ef0364e"});
    var info = jsonDecode(a.body)["data"];
    print(a.body);
    return (info as List).map((e) => Data.fromJson(e)).toList();
  }
  //
  var size,height,width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )
        ),
        backgroundColor: Colors.black45,
        title: Padding(
          padding: const EdgeInsets.only(left: 105.0),
          child: Text("Crm",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500))),
        ),
      ),
      body: FutureBuilder(
          future: fetch(),
          builder: (context,snapshot){
            if(snapshot.hasData){
             List<Data> getting_sporthi = snapshot.data!;
             return SingleChildScrollView(
               child: Column(
                 children: [
                   Stack(
                     children: [
                       Container(
                         height: 1050,
                         width: 420,
                         child: ListView.builder(
                           scrollDirection: Axis.vertical,
                             itemCount: getting_sporthi.length,
                             itemBuilder: (BuildContext context, int index){
                             return Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Card(
                                 child: Container(
                                   height: height/6,
                                   width: width/15,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(12)
                                   ),
                                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Text(getting_sporthi[index].name.toString(),style: TextStyle(color: Colors.grey.shade700,fontSize: 16),),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Text(getting_sporthi[index].companyName == null? "No data found": getting_sporthi[index].companyName.toString(),style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.w500)),),
                                       ),
                                       Row(mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child: Text(getting_sporthi[index].mobileNo == null? "No data found": getting_sporthi[index].mobileNo.toString(),style: TextStyle(fontSize: 16),),
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child: Text(getting_sporthi[index].status.toString(),style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.green,fontSize:16,fontWeight: FontWeight.w600),)),
                                           ),
                                         ],
                                       )

                                     ],
                                   ),

                                 )
                               ),
                             );
                             }
                         ),
                       ),
                       Positioned(
                         top: 750,
                           left: 168,
                           child:  FloatingActionButton(onPressed: (){
                              Get.to(lead());
                                },child: Icon(Icons.add),))
                     ],
                   ),

                 ],
               ),
             );
            }else if(snapshot.hasError){
              return Text("${snapshot.error}");
            }return Center(child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: CircularProgressIndicator(),
            ));
          }
      ),
      
    );
  }
}
