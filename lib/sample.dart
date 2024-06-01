import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class samp extends StatefulWidget {
  @override
  _sampState createState() => _sampState();
}

class _sampState extends State<samp> {
  late BankListDataModel _bankChoose;

  List<BankListDataModel> bankDataList = [
    BankListDataModel("harikrish58027@gmail.com",
        "https://www.kindpng.com/picc/m/83-837808_sbi-logo-state-bank-of-india-group-png.png"),
    BankListDataModel("devadeva339@gmail.com",
        "https://img.freepik.com/premium-photo/cartoon-character-with-blue-background-neon-sign-that-says-i-m-robot_784625-9592.jpg"),
    BankListDataModel("gpraveen3023@gmail.com",
        "https://img.lovepik.com/element/45016/4170.png_860.png"),
    BankListDataModel("nagesh0033@Gmail.com","https://img.freepik.com/free-photo/fashion-boy-with-yellow-jacket-blue-pants_71767-96.jpg?size=338&ext=jpg&ga=GA1.1.2082370165.1711238400&semt=ais"),
    BankListDataModel("partha447@Gmail.com","https://img.freepik.com/premium-photo/cool-man-3d-cartoon-avatar-portrait_839035-196637.jpg"),
  ];

  @override
  void initState() {
    super.initState();
    _bankChoose = bankDataList[0];
  }

  void _onDropDownItemSelected(BankListDataModel newSelectedBank) {
    setState(() {
      _bankChoose = newSelectedBank;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 15, top: 10, right: 15),
          child: DropdownButtonFormField<BankListDataModel>(
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontFamily: "verdana_regular",
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(12, 10, 20, 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            hint: Text(
              "Select Bank",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontFamily: "verdana_regular",
              ),
            ),
            items: bankDataList
                .map<DropdownMenuItem<BankListDataModel>>(
                  (BankListDataModel value) => DropdownMenuItem<BankListDataModel>(
                value: value,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(value.bank_logo),
                    ),
                    SizedBox(width: 15),
                    Text(value.bank_name,style: GoogleFonts.openSans(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),),
                  ],
                ),
              ),
            )
                .toList(),
            onChanged: (BankListDataModel? newSelectedBank) {
              if (newSelectedBank != null) {
                _onDropDownItemSelected(newSelectedBank);
              }
            },
            value: _bankChoose,
          ),
        ),
      ),
    );
  }
}

class BankListDataModel {
  String bank_name;
  String bank_logo;

  BankListDataModel(this.bank_name, this.bank_logo);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is BankListDataModel &&
              runtimeType == other.runtimeType &&
              bank_name == other.bank_name &&
              bank_logo == other.bank_logo;

  @override
  int get hashCode => bank_name.hashCode ^ bank_logo.hashCode;
}