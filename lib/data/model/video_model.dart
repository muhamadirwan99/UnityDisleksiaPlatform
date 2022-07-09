class VideosResult {
  VideosResult({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<Video> data;

  factory VideosResult.fromJson(Map<String, dynamic> json) => VideosResult(
        status: json["status"],
        message: json["message"],
        data: List<Video>.from(json["data"].map((x) => Video.fromJson(x))),
      );
}

class Video {
  Video({
    required this.name,
    required this.idYt,
    required this.desc,
    required this.thumbnail,
    required this.modul,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  String name;
  String idYt;
  String desc;
  String thumbnail;
  String modul;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        name: json["name"],
        idYt: json["idYt"],
        desc: json["desc"],
        thumbnail: json["thumbnail"],
        modul: json["modul"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "idYt": idYt,
        "desc": desc,
        "thumbnail": thumbnail,
        "modul": modul,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
      };
}
