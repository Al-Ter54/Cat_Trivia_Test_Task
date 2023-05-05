import 'package:hive/hive.dart';

part 'fact.g.dart';

@HiveType(typeId: 0)
class Fact extends HiveObject {
  @HiveField(0)
  Status? status;

  @HiveField(1)
  String? sId;

  @HiveField(2)
  String? user;

  @HiveField(3)
  String? text;

  @HiveField(4)
  String? type;

  @HiveField(5)
  bool? deleted;

  @HiveField(6)
  String? createdAt;

  @HiveField(7)
  String? updatedAt;

  @HiveField(8)
  int? iV;

  Fact(
      {this.status,
      this.sId,
      this.user,
      this.text,
      this.type,
      this.deleted,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Fact.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    sId = json['_id'];
    user = json['user'];
    text = json['text'];
    type = json['type'];
    deleted = json['deleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status?.toJson();
    }
    data['_id'] = sId;
    data['user'] = user;
    data['text'] = text;
    data['type'] = type;
    data['deleted'] = deleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

@HiveType(typeId: 1)
class Status {
  @HiveField(0)
  bool? verified;

  @HiveField(1)
  int? sentCount;

  Status({this.verified, this.sentCount});

  Status.fromJson(Map<String, dynamic> json) {
    verified = json['verified'];
    sentCount = json['sentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['verified'] = verified;
    data['sentCount'] = sentCount;
    return data;
  }
}
