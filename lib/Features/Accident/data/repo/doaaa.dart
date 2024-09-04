import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:islami/Features/Accident/data/models/doaa/doaa_model.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class DoaaRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Either<Failure, List<DoaaModel>>> fetchDoaaCollection() async {
    try {
      CollectionReference doaaCollection = _firestore.collection('doaa');
      QuerySnapshot querySnapshot = await doaaCollection.get();

      List<DoaaModel> doaaList = querySnapshot.docs.map((doc) {
        return DoaaModel.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();

      return Right(doaaList);
    } catch (e) {
      print('Error fetching doaa collection: $e');
      return Left(ServerFailure( 'Failed to fetch doaa collection'));
    }
  }
}
