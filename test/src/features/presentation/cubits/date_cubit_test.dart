import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:todo_app/src/features/presentation/cubits/date_cubit.dart';

void main() {
  group('DateCubit Tests', () {
    blocTest<DateCubit, DateTime?>(
      'has null as the initial state',
      build: () => DateCubit(),
      verify: (cubit) => expect(cubit.state, equals(null)),
      expect: () => [],
    );

    blocTest<DateCubit, DateTime?>(
      'emits [selected date] when getDate is called',
      build: () => DateCubit(),
      act: (cubit) {
        final selectedDate = DateTime(2024, 6, 15);
        cubit.getDate(selectedDate);
      },
      expect: () => [DateTime(2024, 6, 15)],
    );

    blocTest<DateCubit, DateTime?>(
      'emits multiple dates correctly',
      build: () => DateCubit(),
      act: (cubit) {
        cubit.getDate(DateTime(2024, 6, 10));
        cubit.getDate(DateTime(2024, 6, 20));
      },
      expect: () => [DateTime(2024, 6, 10), DateTime(2024, 6, 20)],
    );
  });
}
