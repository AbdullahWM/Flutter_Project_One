class ActivityModel {
  String? title;
  String? note;

  ActivityModel({this.title, this.note});

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      title: json["title"] ?? "Untitled",
      note: json["note"] ?? "",
    );
  }
}