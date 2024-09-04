import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:islami/Features/Accident/data/models/doaa/doaa_model.dart';

import 'package:islami/core/errors/failure.dart';

class DoaaRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Either<Failure, List<DoaaModel>>> fetchDoaaCollection(int i) async {
    try {
  CollectionReference doaaCollection = _firestore.collection('doaa');
  QuerySnapshot querySnapshot = await doaaCollection.get();

  // طباعة البيانات للتأكد من جلبها
  print(querySnapshot.docs.map((doc) => doc.data()).toList());

  List<DoaaModel> doaaList = querySnapshot.docs.map((doc) {
    return DoaaModel.fromFirestore(doc.data() as Map<String, dynamic>);
  }).toList();

  // التحقق من أن القائمة ليست فارغة
  if (doaaList.isNotEmpty) {
    print('Data fetched successfully: ${doaaList.length} items');
  } else {
    print('Fetched data is empty.');
  }

  return Right(doaaList);
} catch (e) {
  print('Error fetching doaa collection: $e');
  return Left(ServerFailure('Failed to fetch doaa collection'));
}
  }
}
