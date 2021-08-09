import 'dart:convert';

class EmergenciesModel {
  late Emergencies emergencies;

  EmergenciesModel({required this.emergencies});

  EmergenciesModel.fromJson(Map<String, dynamic> json) {
    emergencies = (json['emergencies'] != null
        ? new Emergencies.fromJson(json['emergencies'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.emergencies != null) {
      data['emergencies'] = this.emergencies.toJson();
    }
    return data;
  }
}

class Emergencies {
  int? count;
  List<Rows>? rows;

  Emergencies({required this.count, required this.rows});

  Emergencies.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['rows'] != null) {
      rows = new List<Rows>.generate(3,
      json['rows'].forEach((v) {
        rows?.add(new Rows.fromJson(v));
      }));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.rows != null) {
      data['rows'] = this.rows?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  // int? id;
  String? user;
  String location = '';
  bool? resolved;
  int? resolvedBy;
  String? comments;
  String description = '';
  String? createdAt;
  String? updatedAt;

  Rows(
      {
      // required this.id,
      required this.user,
      required this.location,
      required this.resolved,
      required this.resolvedBy,
      required this.comments,
      required this.description,
      required this.createdAt,
      required this.updatedAt});

  Rows.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    user = json['user']??"";
    location = json['location']??"";
    resolved = json['resolved']??"";
    resolvedBy = json['resolved_by']??"";
    comments = json['comments']??"";
    description = json['description']??"";
    createdAt = json['createdAt']??"";
    updatedAt = json['updatedAt']??"";

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // final data = new Map<String, dynamic>.from(res['body']);
    // data['id'] = this.id;
    data['user'] = this.user;
    data['location'] = this.location;
    data['resolved'] = this.resolved;
    data['resolved_by'] = this.resolvedBy;
    data['comments'] = this.comments;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
