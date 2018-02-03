
class AVObject {

  AVObject({this.objectId, this.createdAt, this.updatedAt});

  final String objectId;
  final DateTime createdAt;
  final DateTime updatedAt;

  AVObject.fromMap(Map<String, dynamic> map)
      : objectId = map['objectId'] ?? null,
        createdAt = DateTime.parse(map['createdAt']),
        updatedAt = DateTime.parse(map['updatedAt']);

}