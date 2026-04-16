class RadioModel {
  final int id;
  final String name;
  final String url;

  RadioModel({
    required this.id,
    required this.name,
    required this.url,
  });

  factory RadioModel.fromJson(Map<String, dynamic> json) {
    return RadioModel(
      id: json['id'],
      name: (json['name']),
      url: (json['url']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
    };
  }
}