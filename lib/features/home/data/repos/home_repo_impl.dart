import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:swift_mart/core/errors/failures.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';
import 'package:swift_mart/features/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('products');
  @override
  Future<Either<Failure, List<ProductModel>>> fetchProducts() async {
    try {
      QuerySnapshot querySnapshot = await _collectionRef.get();

      final allData = querySnapshot.docs
          .map(
            (doc) =>
                ProductModel.fromFireBase(doc.data() as Map<String, dynamic>),
          )
          .toList();

      return right(allData);
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
