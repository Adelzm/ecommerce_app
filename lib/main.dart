import 'package:db_client/db_client.dart';
import 'package:ecommerce_app/repositories/categories_repo.dart';
import 'package:ecommerce_app/screens/categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final DbClient dbClient = DbClient();
final CategoriesRepo categoriesRepo = CategoriesRepo(dbClient);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await categoriesRepo.createCategories();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const CategoriesScreen(),
    );
  }
}
