class Project {
  Project({
    this.id,
    this.image,
    this.title,
    this.description,
    this.link,
    this.order,
    this.technologiesUsed,
  });

  Project.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    link = json['link'];
    order = json['order'];
    technologiesUsed = json['technologiesUsed'] != null
        ? json['technologiesUsed'].cast<String>()
        : [];
  }

  num? id;
  String? image;
  String? title;
  String? description;
  String? link;
  num? order;
  List<String>? technologiesUsed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['title'] = title;
    map['description'] = description;
    map['link'] = link;
    map['order'] = order;
    map['technologiesUsed'] = technologiesUsed;
    return map;
  }
}
