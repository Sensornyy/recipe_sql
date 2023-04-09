import 'package:flutter/material.dart';

import 'package:recipe_sql/di_container/service_locator.dart' as di;
import 'package:recipe_sql/feat/recipes/presentation/screens/recipes_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade100),
        home: const RecipeScreen());
  }
}
