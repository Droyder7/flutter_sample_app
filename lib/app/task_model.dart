class TaskModel {
  String content;
  DateTime timestamp;
  bool isDone;

  TaskModel({
    required this.content,
    this.isDone = false,
  }) : timestamp = DateTime.now();

  factory TaskModel.fromMap(Map task) {
    return TaskModel(
      content: task["content"],
      isDone: task["isDone"],
    );
  }

  Map toMap() {
    return {
      "content": content,
      "timestamp": timestamp,
      "isDone": isDone,
    };
  }

  void toggleDoneStatus() {
    isDone = !isDone;
  }
}
