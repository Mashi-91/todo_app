class TaskModel {
  final String id;
  final String title;
  final String description;
  final String? imgUrl;
  final String startTaskTime;
  final String endTaskTime;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    this.imgUrl,
    required this.startTaskTime,
    required this.endTaskTime,
  });
}
