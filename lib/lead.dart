import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:spoothi/dashboard.dart';
import 'package:spoothi/sample.dart';
import 'package:google_fonts/google_fonts.dart';

class lead extends StatefulWidget {
  const lead({Key? key});

  @override
  State<lead> createState() => _leadState();
}

class _leadState extends State<lead> {
  final List<String> items = [
    "Tirupur",
    "cbe",
    "Erode",
    "pollachi",
    "Avinashi",
  ];
  late String selecteditem;
  late DateTime selectedDate;
  String selectedGender = 'Male';

  @override
  void initState() {
    super.initState();
    selecteditem = items.first; // Initialize selected item
    selectedDate = DateTime.now(); // Initialize selected date
  }

  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          Get.to(dash());
                        },
                          child: Icon(Icons.arrow_back,color: Colors.green,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 105.0),
                      child: Text(
                        "Lead Form",
                        style: GoogleFonts.openSans(textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 26)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: height / 15,
                        width: width / 3,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(18)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "First Name",hintStyle: GoogleFonts.openSans(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ),
                      Container(
                        height: height / 14,
                        width: width / 3,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(18)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Last Name",hintStyle: GoogleFonts.openSans(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Container(
                  height: height / 15,
                  width: width / 1.3,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(18)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.loop),
                        hintText: "Orangisation",hintStyle: GoogleFonts.openSans(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Container(
                  height: height / 15,
                  width: width / 1.3,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(18)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.description_outlined),
                        hintText: "Description",hintStyle: GoogleFonts.openSans(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Container(
                  height: height / 15,
                  width: width / 1.3,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(18)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.call),
                        hintText: "Mobile Number",hintStyle: GoogleFonts.openSans(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Container(
                  height: height / 15,
                  width: width / 1.3,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black26
                    ),
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(18)),
                  child:  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person),
                          Text("  Genders",style: GoogleFonts.openSans(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),),
                        ],
                      ),
                      DropdownButton<String>(
                        value: selectedGender,
                        onChanged: (String? newValue) { // Update the parameter type to nullable
                          if(newValue != null) { // Check for nullability
                            setState(() {
                              selectedGender = newValue;
                            });
                          }
                        },
                        items: <String>['Male', 'Female'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style: GoogleFonts.openSans(textStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),),
                          );
                        }).toList(),
                      ),
                    ],
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Container(
                  height: height / 5,
                  width: width / 1.2,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(18)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.location_on_outlined),
                          hintText: "Address",hintStyle: GoogleFonts.openSans(textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Divider(
                  height: 2,
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("New cell",style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500))),
                    Container(
                      height: height / 10,
                      width: width / 1.0,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: samp(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: height/10,
                  width: width/1.2,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12)

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Text(
                        //   "New Date",
                        //   style: TextStyle(
                        //       color: Colors.black,
                        //       fontWeight: FontWeight.w500,
                        //       fontSize: 18),
                        // ),
                        SizedBox(height: 20),
                        Text(
                          '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}',
                          style: GoogleFonts.openSans(textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: Text('Select Date',style: GoogleFonts.openSans(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

        Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    _showAlert(context);
                  },
                  child: Container(
                    height: height/18,
                    width: width/2.3,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(child: Text("Submit",style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500)),)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2040),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
  //
  void _showAlert(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Confirm",
      desc: "Are you sure you want to submit this?",style: AlertStyle(descStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
      buttons: [
        DialogButton(
          color: Colors.blue,
          child: GestureDetector(
            onTap: (){
              Get.to(dash());
            },
            child: Text(
              "Yes",
              style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w500),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          width: 120,
        ),
        DialogButton(
          child: Text(
            "No",
            style: TextStyle(color: Colors.yellow, fontSize: 18,fontWeight: FontWeight.w500),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();
  }
}