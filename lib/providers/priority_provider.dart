import 'package:todo_app/widgets/todo_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PriorityNotifier extends StateNotifier<Priority> {
  PriorityNotifier() : super(Priority.normal);

  void changePriority(Priority value) {
    state = value;
  }
}

final selectedPriorityProvider =
    StateNotifierProvider<PriorityNotifier, Priority>(
  (ref) => PriorityNotifier(),
);
