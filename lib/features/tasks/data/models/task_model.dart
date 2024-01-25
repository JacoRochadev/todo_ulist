import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_ulist/features/tasks/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  final String? id;
  const TaskModel({
    this.id,
    required super.description,
    required super.createdAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      description: json['description'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'createdAt': createdAt,
    };
  }

  TaskModel copyWith({
    String? id,
    String? description,
    Timestamp? createdAt,
  }) {
    return TaskModel(
      id: id ?? this.id,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, description, createdAt];
}
