// ignore_for_file: prefer_collection_literals

class TodoModel {
  String? id;
  String? name;
  String? phone;
  String? email;
  String? instituteId;
  TodoModel({
    this.id,
    required this.name,
    required this.instituteId,
    required this.email,
    required this.phone,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      instituteId: json['instituteId'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['instituteId'] = instituteId;
    data['phone'] = phone;
    data['id'] = id;
    return data;
  }
}
