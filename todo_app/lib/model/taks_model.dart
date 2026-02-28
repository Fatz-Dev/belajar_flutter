class TaskModel {
  final int id;
  final String title;
  final String desc;
  final DateTime dueTime;
  final DateTime createTime;
  final bool isFinished;

  TaskModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.dueTime,
    required this.createTime,
    required this.isFinished,
  });

  Map<dynamic, dynamic> toJson() {
    return {
      "id" : id,
      "title" : title,
      "desc" : desc,
      "dueTime" : dueTime.toIso8601String(),
      "createTime" : createTime.toIso8601String(),
      "isFinished" : isFinished ? 1 : 0,
    };
  }

  factory TaskModel.fromJson(Map<dynamic, dynamic> json) {
    return TaskModel(
      id: json["id"] as int,
      title: json["title"] as String,
      desc: json["desc"] as String,
      dueTime: DateTime.parse(json["dueTime"] as String),
      createTime: DateTime.parse(json["createTime"] as String),
      isFinished: json["isFinished"] == 1 ? true : false,
    );
  }
}