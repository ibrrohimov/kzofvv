import 'useful_content_entity.dart';

class UsefulInfoEntity {
  final String title;
  final String image;
  final String text;
  final List<UsefulContentEntity> usefulContent;

  const UsefulInfoEntity({
    required this.title,
    required this.image,
    required this.text,
    required this.usefulContent,
  });
}
