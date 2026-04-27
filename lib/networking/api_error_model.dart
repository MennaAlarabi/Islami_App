class ResponseModel {
  String? message;
  String? token;
  String? name;
  int? statusCode;
  bool? status;

  ResponseModel({
    this.message,
    this.token,
    this.name,
    this.statusCode,
    this.status,
  });

  ResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    name = json['name'];
    statusCode = json['statusCode'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    data['name'] = this.name;
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    return data;
  }
}
