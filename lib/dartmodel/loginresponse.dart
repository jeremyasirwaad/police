class loginresponse {
  String? data;
  String? message;

  loginresponse({this.data, this.message});

  loginresponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['message'] = this.message;
    return data;
  }
}