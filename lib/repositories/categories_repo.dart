import 'package:db_client/db_client.dart';
import 'package:ecommerce_app/models/category.dart';

class CategoriesRepo {
  final DbClient _dbClient;

  CategoriesRepo(DbClient dbClient) : _dbClient = dbClient;

  Future<List<Category>> fetchAll() async {
    try {
      final records = await _dbClient.fetchAll(collectionName: 'categories');
      return records.map((record) => Category.fromJson(record.data, id: record.id)).toList();
    } catch (error) {
      throw Exception('Error fetching categories: $error');
    }
  }

  Future<void> createCategories() async {
    try {
      for (final category in categories) {
        await _dbClient.add(
          collectionName: 'categories',
          data: category,
        );
      }
    } catch (error) {
      throw Exception('Error creating categories: $error');
    }
  }
}

const categories = [
  {
    "name": "Sportswear",
    "description": "This is the sportswear category.",
    "imageUrl":
        "https://images.unsplash.com/photo-1483721310020-03333e577078?q=80&w=3097&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  },
  {
    "name": "Cycling",
    "description": "This is the cycling category.",
    "imageUrl":
        "https://images.unsplash.com/photo-1541625602330-2277a4c46182?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  },
  {
    "name": "Footwear",
    "description": "This is the footwear category.",
    "imageUrl":
        "https://images.unsplash.com/photo-1562183241-b937e95585b6?q=80&w=3505&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  },
  {
    "name": "Accessories",
    "description": "This is the accessories category.",
    "imageUrl":
        "https://images.unsplash.com/photo-1676312830459-f6f13dfdd899?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  },
  {
    "name": "Watersports",
    "description": "This is the watersports category.",
    "imageUrl":
        "https://images.unsplash.com/photo-1576610616656-d3aa5d1f4534?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  },
  {
    "name": "Camping",
    "description": "This is the camping category.",
    "imageUrl":
        "https://images.unsplash.com/photo-1504851149312-7a075b496cc7?q=80&w=3437&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  },
  {
    "name": "Indoor",
    "description": "This is the indoor category.",
    "imageUrl":
        "https://images.unsplash.com/photo-1559369064-c4d65141e408?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  },
  {
    "name": "Golf",
    "description": "This is the golf category.",
    "imageUrl":
        "https://images.unsplash.com/photo-1587174486073-ae5e5cff23aa?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  }
];
