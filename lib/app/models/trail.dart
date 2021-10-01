import 'package:app_trilhas/app/models/custom_image.dart';
import 'package:app_trilhas/app/models/eco_tourism.dart';

class Trail {
  String? about;
  String? address;
  String? cellphone;
  String? difficulty;
  String? distance;
  String? map;
  String? time;
  String? title;
  String? whatsapp;
  List<CustomImage>? images;
  List<Ecotourism>? ecotourisms;

  Trail(
      {this.about,
      this.address,
      this.cellphone,
      this.difficulty,
      this.distance,
      this.map,
      this.time,
      this.title,
      this.whatsapp,
      this.images,
      this.ecotourisms});

  Trail.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    address = json['address'];
    cellphone = json['cellphone'];
    difficulty = json['difficulty'];
    distance = json['distance'];
    map = json['map'];
    time = json['time'];
    title = json['title'];
    whatsapp = json['whatsapp'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        Map<String, dynamic> map = Map<String, dynamic>.from(v);

        images!.add(new CustomImage.fromJson(map));
      });
    }
    if (json['ecotourism'] != null) {
      ecotourisms = [];
      json['ecotourism'].forEach((v) {
        Map<String, dynamic> map = Map<String, dynamic>.from(v);
        ecotourisms!.add(new Ecotourism.fromJson(map));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.about;
    data['address'] = this.address;
    data['cellphone'] = this.cellphone;
    data['difficulty'] = this.difficulty;
    data['distance'] = this.distance;
    data['map'] = this.map;
    data['time'] = this.time;
    data['title'] = this.title;
    data['whatsapp'] = this.whatsapp;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.ecotourisms != null) {
      data['ecotourism'] = this.ecotourisms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
