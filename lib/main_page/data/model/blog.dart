class Blog {
  Blog({
    this.id,
    this.title,
    this.subtitle,
    this.link,
    this.image,
    this.publishedAt,
  });

  Blog.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    link = json['link'];
    image = json['image'];
    publishedAt = json['publishedAt'];
  }

  num? id;
  String? title;
  String? subtitle;
  String? link;
  String? image;
  String? publishedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['subtitle'] = subtitle;
    map['link'] = link;
    map['image'] = image;
    map['publishedAt'] = publishedAt;
    return map;
  }
}
