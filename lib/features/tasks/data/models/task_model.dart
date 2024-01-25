import 'package:todo_ulist/features/tasks/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    required super.description,
    required super.createdAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      description: json['description'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'createdAt': createdAt,
    };
  }

  @override
  List<Object?> get props => [description, createdAt];
}
