import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable(createToJson: false)
class Tag {
  final String id;
  final String name;
  final String slug;
  
  const Tag({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}
