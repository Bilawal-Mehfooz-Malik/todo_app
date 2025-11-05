import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

// Define the Todos table
@DataClassName('TodoEntry') // Custom name for the generated data class
class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)(); // Corresponds to Todo.name
  TextColumn get description => text().nullable()();
  DateTimeColumn get deadline => dateTime()(); // Corresponds to Todo.deadline
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))(); // Corresponds to Todo.isCompleted
}

@DriftDatabase(tables: [Todos])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.e); // Constructor for testing

  @override
  int get schemaVersion => 1; // Increment this when you change your schema
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}