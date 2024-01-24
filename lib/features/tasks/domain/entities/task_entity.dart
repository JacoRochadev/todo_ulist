import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String description;
  final DateTime createdAt;

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
