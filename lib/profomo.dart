import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:spoothi/Apis_perfomoinvoice.dart';

class profomo extends StatefulWidget {
  @override
  _profomoState createState() => _profomoState();
}

class _profomoState extends State<profomo> {
  late Map<String, dynamic> invoiceData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url =
    // 'https://3pin.glenmargon.com/api/resource/$doctype?fields=["name","party"]&limit_page_length=500';
        'https://demo.regenterp.com/api/resource/Sales Order/$promo_no';
    HttpClient client = new HttpClient();
    client.badCertificateCallback =
    ((X509Certificate cert, String host, int port) => true);
    IOClient ioClient = new IOClient(client);

    try {
      final response = await ioClient.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'token 6d2ca3be092e460:f3628df3ef0364',
          'Content-Type': 'application/json'
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          invoiceData = json.decode(response.body)["data"];
        });
      } else {
        // Handle error
        print('Failed to load invoice data');
      }
    } catch (e) {
      throw Exception('Failed to load document IDs: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice Details'),
        centerTitle: true,
        backgroundColor: Color(0xFFed6e00),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: GestureDetector(
              child: Icon(Icons.picture_as_pdf),
              onTap: () => print('pdf'),
            ),
          )
        ],
      ),
      body:
      invoiceData == null
          ? Center(child: CircularProgressIndicator())
          : buildInvoiceDetails(),
    );
  }

  Widget buildInvoiceDetails() {
    List<String> dateParts = invoiceData["date"].split('-');
    String formattedDate = '${dateParts[2]}-${dateParts[1]}-${dateParts[0]}';
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Invoice Number: ${invoiceData["name"]}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            // Center(
            //   child: Text(
            //     'Invoiced Date: ${formattedDate}',
            //     style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            // SizedBox(height: 16),
            // Text(
            //   'Items:',
            //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            //   textAlign: TextAlign.center,
            // ),
            Container(
              height: 380,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    invoiceData["details"].length,
                        (index) {
                      dynamic item = invoiceData["details"][index];
                      Color tileColor =
                      index.isOdd ? Colors.white : Colors.orange.shade50;

                      return Container(
                        // color: tileColor,
                        child: ListTile(
                          title: Text(item["product"]),
                          subtitle: Text(
                            'Size: ${item["size"]}, Quantity: ${item["qty"]}, Amount: \₹${item["amount"]}',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const Center(
              child: Icon(
                Icons.arrow_downward_outlined,
                color: Colors.black,
                size: 20.0,
              ),
            ),
            const Text(
              'Tax Details:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: buildtaxList(invoiceData["tax_details"]),
              ),
            ),
            Text(
              'Other Charges & Discount:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Container(
              // color: Colors.blue,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: buildocList(invoiceData["oc_details"]),
              ),
            ),
            Container(
              // color: Colors.blue,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Discount: \₹${invoiceData["total_cash_dis_amt"]}',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.right,
                  )
                ],
              ),
            ),
            SizedBox(height: 35),
            Center(
              child: Text(
                'Total Amount: \₹${invoiceData["grand_total"]}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // List<Widget> buildItemList(List<dynamic> items) {
  //   return items.map((item) {
  //     return ListTile(
  //       title: Text(item["product"]),
  //       subtitle: Text(
  //           'Size: ${item["size"]}, Quantity: ${item["qty"]}, Amount: \₹${item["amount"]}'),
  //     );
  //   }).toList();
  // }

  List<Widget> buildtaxList(List<dynamic> items) {
    return items.map((item) {
      return Text(
          '${item["gst_per"]}    ${item["rate"]}     \₹${item["amount"]}');
    }).toList();
  }

  List<Widget> buildocList(List<dynamic> items) {
    return items.map((item) {
      return Text('${item["oc_name"]}  \₹${item["amount"]}');
    }).toList();
  }
}