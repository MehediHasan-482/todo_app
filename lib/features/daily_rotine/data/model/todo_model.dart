class TodoModel {
  final int id;
  final String title;
  final bool isCompleted;
  
  TodoModel({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  //JSON TO DART OBJECT
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted'],
    );
  }

  //DART OBJECT TO JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
    };
  }
}