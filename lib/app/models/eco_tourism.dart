import 'package:app_trilhas/app/models/custom_image.dart';
import 'package:app_trilhas/app/models/trail.dart';

class Ecotourism {
  String? about;
  String? address;
  String? cellphone;
  String? title;
  String? whatsapp;
  String? map;
  Trail? trail;
  List<CustomImage>? images;

  Ecotourism(
      {this.about,
      this.address,
      this.cellphone,
      this.title,
      this.whatsapp,
      this.images,
      this.map});

  Ecotourism.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    address = json['address'];
    cellphone = json['cellphone'];
    title = json['title'];
    whatsapp = json['whatsapp'];
    map = json['map'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        Map<String, dynamic> map = Map<String, dynamic>.from(v);
        images!.add(new CustomImage.fromJson(map));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.about;
    data['address'] = this.address;
    data['cellphone'] = this.cellphone;
    data['title'] = this.title;
    data['whatsapp'] = this.whatsapp;
    data['map'] = this.map;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
