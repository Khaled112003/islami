import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:islami/Features/Accident/data/models/doaa/doaa_model.dart';

import 'package:islami/core/errors/failure.dart';

class DoaaRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Either<Failure, List<DoaaModel>>> fetchDoaaCollection(int i) async {
    try {
      CollectionReference doaaCollection = _firestore.collection('doaa');

      // جلب البيانات من مجموعة الأدعية
      QuerySnapshot querySnapshot = await doaaCollection.get();

      // تحويل البيانات إلى قائمة من نماذج الأدعية
      List<DoaaModel> doaaList = querySnapshot.docs.map((doc) {
        return DoaaModel.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();

      return Right(doaaList); // إرجاع البيانات بنجاح
    } catch (e) {
      print('Error fetching doaa collection: $e');
      return Left(ServerFailure(e.toString())); // إرجاع الفشل
    }
  }
}
