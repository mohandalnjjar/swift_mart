import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swift_mart/core/errors/failures.dart';
import 'package:swift_mart/core/functions/uploadImage_profile_to_firebase_fire_store.dart';
import 'package:swift_mart/core/functions/upload_images_to_fire_storage.dart';
import 'package:swift_mart/features/home/data/models/product_dynamic_data.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';
import 'package:swift_mart/features/home/data/repos/home_repo.dart';
import 'package:swift_mart/features/home/data/models/order_model.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Stream<Either<Failure, List<ProductModel>>> fetchProducts({
    required int limit,
  }) async* {

    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('products');

    try {
      await for (QuerySnapshot querySnapshot
          in collectionRef.limit(limit).snapshots()) {
        final allData = querySnapshot.docs
            .map(
              (doc) =>
                  ProductModel.fromFireBase(doc.data() as Map<String, dynamic>),
            )
            .toList();

        yield right(allData);
      }
    } catch (e) {
      yield left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Stream<Either<Failure, List<ProductDynamicData>>>
      streamProductDetails() async* {
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('products');

    try {
      await for (QuerySnapshot querySnapshot in collectionRef.snapshots())
      
       {
        final allData = querySnapshot.docs
            .map(
              (doc) => ProductDynamicData.fromFirebase(
                  doc.data() as Map<String, dynamic>),
            )
            .toList();

        yield right(allData);
      }
    } catch (e) {
      yield left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Stream<Either<Failure, List<ProductModel>>> fetchMostRatedProducts({
    required int limit
  }) async* {
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('products');

    try {
      await for (QuerySnapshot querySnapshot in collectionRef
          .orderBy('rate', descending: true)
          .limit(limit)
          .snapshots()) {
        final allData = querySnapshot.docs
            .map(
              (doc) =>
                  ProductModel.fromFireBase(doc.data() as Map<String, dynamic>),
            )
            .toList();

        yield right(allData);
      }
    } catch (e) {
      yield left(
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
  Future<Either<Failure, void>> removeFromCart({
    required ProductModel productModel,
  }) async {
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
  Future<Either<Failure, void>> uploadUserimage(
      {required ImageSource source}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    final picker = ImagePicker();

    if (user == null) {
      return left(
        ServerFailure(errorMessage: 'User Not Found'),
      );
    }

    try {
      final XFile? pickedImage = await picker.pickImage(
        source: source,
      );

      if (pickedImage == null) {
        return left(
          ImageError(
            errorMessage: 'Image not Selected',
          ),
        );
      }

      final imageUrl = await uploadImage(user.uid, pickedImage.path);
      await updateUserProfileImage(user.uid, imageUrl);

      return right(null);
    } catch (e) {
      return left(
        ImageError(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> uploadUserDetails({
    required String name,
    required String phone,
    required String address,
  }) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    if (user == null) {
      return left(
        ServerFailure(errorMessage: 'User Not Found'),
      );
    }

    try {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).update(
        {
          'name': name,
          'phone': phone,
          'address': address,
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
  Future<Either<Failure, void>> addToCart({
    required ProductModel productModel,
    required String? selectedSize,
  }) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;

      final DocumentSnapshot<Map<String, dynamic>> productSnapshot =
          await FirebaseFirestore.instance
              .collection('products')
              .doc(productModel.id)
              .get();
      final int? availableQuantity = productSnapshot.data()?['quantity'];

      if (availableQuantity == null || availableQuantity <= 0) {
        return left(
          ServerFailure(
            errorMessage: 'Sorry, there is not enough quantity',
          ),
        );
      } else {
        final userDoc =
            FirebaseFirestore.instance.collection('users').doc(user!.uid);

        final DocumentSnapshot<Map<String, dynamic>> userDocSnapshot =
            await userDoc.get();
        List<dynamic> userCart = userDocSnapshot.data()?['userCart'] ?? [];

        final existingProductIndex = userCart.indexWhere(
          (product) =>
              product['id'] == productModel.id &&
              product['selectedSize'] == selectedSize,
        );
        if (existingProductIndex != -1) {
          if (availableQuantity <
              userCart[existingProductIndex]['quantity'] + 1) {
            return left(
              ServerFailure(
                errorMessage: 'Sorry, there is not enough quantity',
              ),
            );
          }
          userCart[existingProductIndex]['quantity'] += 1;
        } else {
          Map<String, dynamic> updatedProduct =
              productModel.addSelected(selectedSize: selectedSize);

          updatedProduct['quantity'] = 1;
          
          userCart.add(updatedProduct);
        }
        await userDoc.update({
          'userCart': userCart,
        });
      }

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
  Future<Either<Failure, void>> checkProductAvailability() async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;
      final userDoc =
          FirebaseFirestore.instance.collection('users').doc(user!.uid);
      final DocumentSnapshot<Map<String, dynamic>> userDocSnapshot =
          await userDoc.get();

      List<dynamic> userCart = userDocSnapshot.data()?['userCart'] ?? [];
      for (var cartItem in userCart) {
        String productId = cartItem['id'];
        int cartQuantity = cartItem['quantity'];

        final productDoc = await FirebaseFirestore.instance
            .collection('products')
            .doc(productId)
            .get();

        if (!productDoc.exists) {
          return left(ServerFailure(
              errorMessage: 'Product not found for ID: $productId'));
        }

        Map<String, dynamic>? productData = productDoc.data();
        int availableQuantity = productData?['quantity'] ?? 0;

        if (cartQuantity > availableQuantity) {
          return left(
            ServerFailure(
                errorMessage:
                    'there is not enough quantity for ${cartItem['title']} only available $availableQuantity'),
          );
        } else {
          return const Right(
            null,
          );
        }
      }
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
    return left(
      ServerFailure(
        errorMessage: 'Some thing went wronttry again',
      ),
    );
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

      List<dynamic> userCart = docSnapshot.get('userCart');

      int productIndex = userCart.indexWhere(
        (product) =>
            product['id'] == productModel.id &&
            product['selectedSize'] == productModel.selectedSize,
      );

      int currentQuantity = userCart[productIndex]['quantity'];
      int newQuantity = increase ? currentQuantity + 1 : currentQuantity - 1;

      final DocumentSnapshot<Map<String, dynamic>> productSnapshot =
          await FirebaseFirestore.instance
              .collection('products')
              .doc(productModel.id)
              .get();
      final int? productQuantity = productSnapshot.data()?['quantity'];

      if (productIndex != -1 && newQuantity > 0 && productQuantity != null) {
        if (newQuantity > productQuantity) {
          userCart[productIndex]['quantity'] = productQuantity;

          await docRef.update(
            {
              'userCart': userCart,
            },
          );

          return left(
            ServerFailure(
              errorMessage:
                  'Sorry, there is no enough quantity for${productModel.title}',
            ),
          );
        }

        userCart[productIndex]['quantity'] = newQuantity;

        await docRef.update({'userCart': userCart});

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
  Future<Either<Failure, void>> submitOrder(
      {required OrderModel orderModel}) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;

      await FirebaseFirestore.instance.collection('orders').doc(user!.uid).set(
            orderModel.toMap(),
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
}
