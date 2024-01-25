import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String description;
  final Timestamp createdAt;

  const TaskEntity({
    required this.description,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        description,
        createdAt,
      ];
}
