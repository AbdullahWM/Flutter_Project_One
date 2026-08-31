import 'package:project_1/model/activity_model.dart';

class CityModel {
  String? name;
  String? image;
  String? description;
  List<ActivityModel>? thingsToDo;

  CityModel({this.name, this.image, this.description, this.thingsToDo});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    List rawThings = json["things_to_do"] ?? [];

    return CityModel(
      name: json["name"] ?? "Unknown city",
      image: json["image"] ?? "https://...",
      description: json["description"] ?? "No description",
      thingsToDo: rawThings
          .map((item) => ActivityModel.fromJson(item))
          .toList(),
    );
  }
}
