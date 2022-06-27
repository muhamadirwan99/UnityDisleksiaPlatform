class TipsResult {
  TipsResult({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<Tips> data;

  factory TipsResult.fromJson(Map<String, dynamic> json) => TipsResult(
        status: json["status"],
        message: json["message"],
        data: List<Tips>.from(json["data"].map((x) => Tips.fromJson(x))),
      );
}

class Tips {
  Tips({
    required this.category,
    required this.name,
    required this.desc,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  String category;
  String name;
  String desc;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  factory Tips.fromJson(Map<String, dynamic> json) => Tips(
        category: json["category"],
        name: json["name"],
        desc: json["desc"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );
}
