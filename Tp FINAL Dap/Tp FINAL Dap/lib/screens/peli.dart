class Peli {
  String id;
  String title;
  String description;
  String imageUrl;

  static var length;

  Peli({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  factory Peli.fromDocument(String id, Map<String, dynamic> data) {
    return Peli(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '', 
      imageUrl: data['imageUrl'] ?? '',
    );
  }
}
