import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_ulist/features/tasks/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  final String? id;
  const TaskModel({
    this.id,
    required super.description,
    required super.createdAt,
    required super.updatedAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      description: json['description'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  TaskModel copyWith({
    String? id,
    String? description,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return TaskModel(
      id: id ?? this.id,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        description,
        createdAt,
        updatedAt,
      ];
}
