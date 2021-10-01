class About {
  String? text;
  String? image;

  About();

  About.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isCover'] = this.text;
    data['image'] = this.image;
    return data;
  }
}
