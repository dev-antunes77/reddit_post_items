// ignore_for_file: public_member_api_docs, sort_constructors_first

class PostItem {
  PostItem({
    this.id = '',
    required this.title,
    required this.author,
    required this.ups,
    required this.numberOfComments,
    required this.createdAt,
    this.fromHive = false,
    this.hiveIndex = 0,
  });
  final String id;
  final String title;
  final String author;
  final int ups;
  final int numberOfComments;
  final DateTime createdAt;
  final bool fromHive;
  final int hiveIndex;

  PostItem copyWith({
    String? id,
    String? title,
    String? author,
    int? ups,
    int? numberOfComments,
    DateTime? createdAt,
    bool? fromHive,
    int? hiveIndex,
  }) {
    return PostItem(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      ups: ups ?? this.ups,
      numberOfComments: numberOfComments ?? this.numberOfComments,
      createdAt: createdAt ?? this.createdAt,
      fromHive: fromHive ?? this.fromHive,
      hiveIndex: hiveIndex ?? this.hiveIndex,
    );
  }
}
