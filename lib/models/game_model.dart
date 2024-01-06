class Games {
  String title;
  String description;
  String image;
  List<String> categories;
  List<String> plataforms;
  String release;

  Games(
      {required this.title,
      required this.description,
      required this.image,
      required this.categories,
      required this.plataforms,
      required this.release});

  factory Games.fromJson(Map<String, dynamic> json) {
    List<String> categories = (json['categories'] as List<dynamic>).cast<String>();
    List<String> platforms = (json['platforms'] as List<dynamic>).cast<String>();
    
    return Games(
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    image: json['image_url'] ?? '',
    categories: categories,
    plataforms: platforms,
    release: json['release'] ?? '');
  }
}
