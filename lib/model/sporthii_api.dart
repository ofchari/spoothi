class sportee {
  List<Data>? data;

  sportee({this.data});

  sportee.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? companyName;
  String? leadName;
  String? mobileNo;
  String? status;

  Data(
      {this.name, this.companyName, this.leadName, this.mobileNo, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    companyName = json['company_name'];
    leadName = json['lead_name'];
    mobileNo = json['mobile_no'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['company_name'] = this.companyName;
    data['lead_name'] = this.leadName;
    data['mobile_no'] = this.mobileNo;
    data['status'] = this.status;
    return data;
  }
}
