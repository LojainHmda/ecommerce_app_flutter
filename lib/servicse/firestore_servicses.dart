import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirestoreService._();
  static final instance = FirestoreService._();

  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  Future<void> setData(
      {required String path, required Map<String, dynamic> data}) async {
    final reference = firestore.doc(path);
    await reference.set(data);
  }

  Future<void> deleteData({required String path}) async {
    final reference = firestore.doc(path);
    await reference.delete();
  }

Stream<List<T>> collectionStream<T>({
  required String path,
  T Function(Map<String, dynamic> data, String documentId)? builder,
  Query Function(Query query)? queryBuilder,
  int Function(T lhs, T rhs)? sort,
}) {
  Query query = firestore.collection(path);

  if (queryBuilder != null) {
    query = queryBuilder(query);
  }

  final snapshots = query.snapshots();
  return snapshots.map((snapshot) {
    final result = snapshot.docs
        .map((snapshot) =>
            builder?.call(snapshot.data() as Map<String, dynamic>, snapshot.id))
        .whereType<T>()
        .toList();

    if (sort != null) {
      result.sort(sort);
    }

    return result;
  });
}

  Stream<T> documentStream<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentId) builder,
  }) {
    return FirebaseFirestore.instance.doc(path).snapshots().map((snapshot) {
      return builder(snapshot.data() as Map<String, dynamic>, snapshot.id);
    });
  }

  Future<T> getDocument<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentId) builder,
  }) async {
    final reference = firestore.doc(path);
    final snapshot = await reference.get();
    final data = snapshot.data();
    final documentId = snapshot.id;
    return builder(data as Map<String, dynamic>, documentId);
  }

  Future<List<T>> getCollection<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentId) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) async {
    Query query = firestore.collection(path);

    if (queryBuilder != null) {
      query = queryBuilder(query);
    }

    final snapshot = await query.get();

    final result = snapshot.docs
        .map((snapshot) =>
            builder(snapshot.data() as Map<String, dynamic>, snapshot.id))
        .where((value) => value != null)
        .toList();
    if (sort != null) {
      result.sort(sort);
    }

    return result;
  }
}
