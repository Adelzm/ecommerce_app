import 'dart:math';

import 'package:db_client/db_client.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/repositories/categories_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> _categories = [];
  List<int> _extents = [];
  final rnd = Random();

  @override
  void initState() async {
    await _loadCategories();
    super.initState();
  }

  Future<void> _loadCategories() async {
    final categories = await categoriesRepo.fetchAll();

    // Generate list containing a random height for each category on the grid
    // Add one to assure it's never zero
    final heights = List.generate(_categories.length, (index) => rnd.nextInt(3) + 1);
    setState(() {
      _categories = categories;
      _extents = heights;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: MasonryGridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        padding: const EdgeInsets.only(
          top: 120,
          left: 4,
          right: 4,
        ),
        itemCount: _categories.length,
        itemBuilder: (BuildContext context, int index) {
          final height = 100 * _extents[index];
          final category = _categories[index];
          return InkWell(
            onTap: () {},
            child: Hero(
              tag: category.id,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(category.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                height: height.toDouble(),
              ),
            ),
          );
        },
      ),
    );
  }
}
