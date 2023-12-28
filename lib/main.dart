import 'package:flutter/material.dart';
import 'package:todo_app/data/todo_data.dart';
import 'package:todo_app/widgets/todo_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/widgets/bottom_sheet_content.dart';

final _lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: _lightTheme,
      debugShowCheckedModeBanner: false,
      home: const DefaultTabController(length: 3, child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // Modal Bottom Sheet
  void _showModalBottomSheet(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        useSafeArea: true,
        showDragHandle: true,
        isScrollControlled: true,
        builder: (ctx) {
          return BottomSheetContent();
        });
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            _appBar(style),
          ];
        },
        body: const TabBarView(
          children: [
            Tab(child: TodoList(priority: Priority.important)),
            Tab(child: TodoList(priority: Priority.normal)),
            Tab(child: TodoList(priority: Priority.extra))
          ],
        ),
      ),

      //* Floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showModalBottomSheet(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  SliverAppBar _appBar(ThemeData style) {
    return SliverAppBar(
      backgroundColor: style.colorScheme.primary,
      foregroundColor: style.colorScheme.onPrimary,
      pinned: true,
      floating: true,
      title: const Text('Todo App'),
      bottom: const TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: <Widget>[
          Tab(text: 'Important'),
          Tab(text: 'Normal'),
          Tab(text: 'Extra'),
        ],
      ),
    );
  }
}
