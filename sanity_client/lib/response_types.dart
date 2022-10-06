import 'package:json_annotation/json_annotation.dart';

part 'response_types.g.dart';

@JsonSerializable()
class SanityDataset {
  final String name;
  final String aclMode;

  SanityDataset({required this.name, required this.aclMode});

  factory SanityDataset.fromJson(Map<String, dynamic> json) =>
      _$SanityDatasetFromJson(json);
}
