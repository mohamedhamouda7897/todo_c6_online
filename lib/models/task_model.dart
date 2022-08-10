class TaskModel {
  String id;
  String title;
  String description;
  int datetime;
  bool isDone;

  TaskModel({
    this.id = '',
    required this.title,
    required this.description,
    required this.datetime,
    this.isDone = false,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'] as String,
            title: json['title'] as String,
            description: json['description'] as String,
            datetime: json['date'] as int,
            isDone: json['isDone'] as bool);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': datetime,
      'isDone': isDone
    };
  }
}
