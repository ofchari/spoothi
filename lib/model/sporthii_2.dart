class invoice {
  List<Data>? data;

  invoice({this.data});

  invoice.fromJson(Map<String, dynamic> json) {
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
  String? customer;
  String? orderType;
  String? qtnStatus;
  String? validityOfPi;
  String? roundedTotal;

  Data(
      {this.name,
        this.customer,
        this.orderType,
        this.qtnStatus,
        this.validityOfPi,
        this.roundedTotal});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    customer = json['customer'];
    orderType = json['order_type'];
    qtnStatus = json['qtn_status'];
    validityOfPi = json['validity_of_pi'];
    roundedTotal = json['rounded_total'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['customer'] = this.customer;
    data['order_type'] = this.orderType;
    data['qtn_status'] = this.qtnStatus;
    data['validity_of_pi'] = this.validityOfPi;
    data['rounded_total'] = this.roundedTotal.toString();
    return data;
  }
}
