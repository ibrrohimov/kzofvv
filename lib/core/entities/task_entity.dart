import 'preview_entity.dart';

class TaskEntity {
  final String task;
  final String type;
  final String priority;
  final String timeframe;
  final String description;

  const TaskEntity({
    required this.task,
    required this.type,
    required this.priority,
    required this.timeframe,
    required this.description,
  });

  List<PreviewEntity> toStringList() {
    return [
      PreviewEntity(type: "Task", value: task),
      PreviewEntity(type: "Type", value: type),
      PreviewEntity(type: "Priority", value: priority),
      PreviewEntity(type: "Timeframe", value: timeframe),
      PreviewEntity(type: "Description", value: description),
    ];
  }
}
