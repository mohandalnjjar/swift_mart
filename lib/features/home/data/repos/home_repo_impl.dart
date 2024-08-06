import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  @override
  Future<Either<Failure, void>> addFavorites({
    required ProductModel productModel,
  }) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;
      final userFav =
          FirebaseFirestore.instance.collection('users').doc(user!.uid);

      await userFav.update(
        {
          'userWish': FieldValue.arrayUnion(
            [
              productModel.toMap(),
            ],
          )
        },
      );

      return right(null);
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> removeFavorites(
      {required ProductModel productModel}) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;
      final userFav =
          FirebaseFirestore.instance.collection('users').doc(user!.uid);

      await userFav.update(
        {
          'userWish': FieldValue.arrayRemove(
            [
              productModel.toMap(),
            ],
          )
        },
      );

      return right(null);
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> addToCart(
      {required ProductModel productModel}) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;
      final userFav =
          FirebaseFirestore.instance.collection('users').doc(user!.uid);
      Map<String, dynamic> updatedProduct = productModel.toMap();
      updatedProduct['quantity'] = 1;
      await userFav.update(
        {
          'userCart': FieldValue.arrayUnion(
            [
              updatedProduct,
            ],
          )
        },
      );

      return right(null);
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> removeFromCart(
      {required ProductModel productModel}) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;
      final userFav =
          FirebaseFirestore.instance.collection('users').doc(user!.uid);

      DocumentSnapshot docSnapshot = await userFav.get();
      List<dynamic> array = docSnapshot.get('userCart');
      Map<String, dynamic>? productToRemove;

      for (var product in array) {
        if ((product as Map<String, dynamic>)['id'] == productModel.id) {
          productToRemove = product;
        }
      }
      await userFav.update(
        {
          'userCart': FieldValue.arrayRemove([productToRemove])
        },
      );

      return right(null);
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, int>> updateQuantity(
      {required ProductModel productModel, required bool increase}) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;

      DocumentReference docRef =
          FirebaseFirestore.instance.collection('users').doc(user!.uid);
      DocumentSnapshot docSnapshot = await docRef.get();
      List<dynamic> array = docSnapshot.get('userCart');
      int index = array.indexWhere((item) => item['id'] == productModel.id);

      int currentQuantity = array[index]['quantity'];
      int newQuantity = increase ? currentQuantity + 1 : currentQuantity - 1;

      if (index != -1 && newQuantity > 0) {
        Map<String, dynamic> updatedProduct = productModel.toMap();
        updatedProduct['quantity'] = newQuantity;

        array[index] = updatedProduct;

        await docRef.update(
          {
            'userCart': array,
          },
        );
        return right(newQuantity);
      } else {
        return left(
          ServerFailure(
            errorMessage: 'Can\'t be less than one item',
          ),
        );
      }
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
