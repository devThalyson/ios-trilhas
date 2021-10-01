class CustomImage {
  bool? isCover;
  String? url;

  CustomImage({this.isCover, this.url});

  CustomImage.fromJson(Map<String, dynamic> json) {
    isCover = json['isCover'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isCover'] = this.isCover;
    data['url'] = this.url;
    return data;
  }
}
