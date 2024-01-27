class DbRecord {
  final String id;
  final Map<String, dynamic> data;

  DbRecord({required this.id, this.data = const {}});

  @override
  String toString() {
    return 'DbRecord{id: $id, data: $data}';
  }
}
