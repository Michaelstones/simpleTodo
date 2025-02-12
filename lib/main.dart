import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/hive_user_data_store.dart';
import 'package:todo/model/task.dart';
import 'package:todo/model/user.dart';
import 'package:todo/view/home/home_view.dart';
import 'package:todo/view/login/login_view.dart';
import 'data/hive_data_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize hive
  await Hive.initFlutter();
  // registerAdapter(TaskAdapter());
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(UserAdapter());

  // open a box
  await Hive.openBox<User>(HiveUserDataStore.boxName);
  Box box = await Hive.openBox<Task>(HiveDataStore.boxName);

  // this function remove all tasks uncompleted
  box.values.forEach((task) => task.createdAtTime.day != DateTime.now().day
      ? box.delete(task.id)
      : null);

  runApp(ProviderScope(child: BaseWidget(child: MyApp())));
}

class BaseWidget extends InheritedWidget {
  BaseWidget({super.key, required this.child}) : super(child: child);

  final HiveDataStore dataStore = HiveDataStore();
  @override
  final Widget child;

  static BaseWidget of(BuildContext context) {
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();
    if (base != null) {
      return base;
    } else {
      throw StateError("BaseWidget not found");
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userBox = Hive.box<User>(HiveUserDataStore.boxName);
    final user = userBox.isNotEmpty ? userBox.values.first : null;
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: user != null ? const HomeView() : LoginView(),
      home: HomeView(),
    );
  }
}
