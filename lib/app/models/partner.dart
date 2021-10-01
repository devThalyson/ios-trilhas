class Partner {
  String? name;
  String? url;
  String? image;

  Partner({this.name, this.url, this.image});

  Partner.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['link'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['link'] = this.url;
    data['image'] = this.image;
    return data;
  }
}
