import 'package:json_annotation/json_annotation.dart';

import 'tag.dart';

part 'job.g.dart';

@JsonSerializable(createToJson: false)
class Job {
  const Job({
    required this.id,
    required this.title,
    this.tags,
    this.locationNames,
    required this.description,
    this.isFeatured = false,
  });

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

  final String id;
  final String title;
  final String description;

  final List<Tag>? tags;
  @JsonKey(includeIfNull: true)
  final String? locationNames;
  @JsonKey(defaultValue: false)
  final bool isFeatured;
}
