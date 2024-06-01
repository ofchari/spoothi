import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:http/io_client.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spoothi/profomo.dart';

import 'model/sporthii_2.dart';


String promo_no = '';
class quot extends StatefulWidget {
  const quot({super.key});

  @override
  State<quot> createState() => _quotState();
}

class _quotState extends State<quot> {
  get customer => null;

  Future<List<Data>> fetching_quote() async{
    HttpClient client = new HttpClient();
    client.badCertificateCallback =
    ((X509Certificate cert, String host, int port) => true);
    IOClient ioClient = new IOClient(client);
    var b = await ioClient.get(Uri.parse('https://demo.regenterp.com/api/resource/Sales Order?fields=["name","customer","order_type","qtn_status","validity_of_pi","rounded_total"]'),headers: {"Authorization": "token 6d2ca3be092e460:f3628df3ef0364e"},);
    var information = jsonDecode(b.body)["data"];
    print(b.body);
    return (information as List).map((e) => Data.fromJson(e)).toList();
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
        backgroundColor: Colors.black38,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          )
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Text("Proforma Invoice",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500)),),
        ),
      ),
      body: FutureBuilder(
          future: fetching_quote(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              List<Data> getting_quotes = snapshot.data!;
              return Column(
                children: [
                  Container(
                    height: height/1,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                        itemCount: getting_quotes.length,
                        itemBuilder: (BuildContext context, int index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: GestureDetector(
                              onTap: ()async{
                                print(getting_quotes[index].name);
                                setState(() {
                                  promo_no = getting_quotes[index].name!;
                                });
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => profomo(),
                                  ),
                                );
                              },
                              child: Container(
                                height: height/3.7,
                                width: width/1,
                                child: Column(
                                  children: [
                                     Padding(
                                       padding: const EdgeInsets.only(top: 15.0),
                                       child: Column(
                                         children: [
                                           Text(getting_quotes[index].name.toString(),style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.orange,fontSize: 16,fontWeight: FontWeight.w500)),),
                                           Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child: Text(getting_quotes[index].customer.toString(),style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.deepPurple,fontSize: 16,fontWeight: FontWeight.w500)),),
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child: Text(getting_quotes[index].orderType.toString(),style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.w600)),),
                                           ),
                                         ],
                                       ),
                                     ),
                                     // Text(getting_quotes[index].qtnStatus.toString(),style: TextStyle(color: Colors.green,fontSize: 12,fontWeight: FontWeight.w600),),
                                    Divider(
                                      height: 1,
                                      thickness: 1.2,
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              Text("Validity_pi",style: GoogleFonts.notoSans(textStyle: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600)),),
                                              Text(getting_quotes[index].validityOfPi.toString(),style: GoogleFonts.notoSans(textStyle: TextStyle(color: Colors.purple,fontSize: 16)),)
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text("Rounded_total",style: GoogleFonts.notoSans(textStyle: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600)),),
                                              Text(getting_quotes[index].roundedTotal.toString(),style: GoogleFonts.notoSans(textStyle: TextStyle(color: Colors.pink,fontSize: 16,fontWeight: FontWeight.w500)),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(getting_quotes[index].qtnStatus?? " ".toString(),style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.brown,fontSize: 18,fontWeight: FontWeight.w500),))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                        }
                    ),
                  )
                ],
              );
            }else if(snapshot.hasError){
              return Text("${snapshot.error}");
            }return Center(child: CircularProgressIndicator());
          }
      ),
      
    );
  }
}
