// To parse this JSON data, do
//
//     final photos = photosFromJson(jsonString);

import 'dart:convert';

List<PhotoModel> photosFromJson(String jsonString) => List<PhotoModel>.from(
    json.decode(jsonString).map((x) => PhotoModel.fromJson(x)));

String photosToJson(List<PhotoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotoModel {
  PhotoModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };

  @override
  String toString() {
    return 'Photos{albumId: $albumId, id: $id, title: $title, url: $url';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoModel &&
          runtimeType == other.runtimeType &&
          albumId == other.albumId &&
          id == other.id &&
          title == other.title &&
          url == other.url &&
          thumbnailUrl == other.thumbnailUrl;

  @override
  int get hashCode =>
      albumId.hashCode ^
      id.hashCode ^
      title.hashCode ^
      url.hashCode ^
      thumbnailUrl.hashCode;

  // override existing member variables with given values
  PhotoModel copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) {
    return PhotoModel(
      albumId: albumId ?? this.albumId,
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }
}
