import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swift_mart/core/errors/failures.dart';
import 'package:swift_mart/features/home/data/models/product_dynamic_data.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';

abstract class HomeRepo {
  Stream<Either<Failure, List<ProductModel>>> fetchProducts({
    required int limit,
  });

  Stream<Either<Failure, List<ProductDynamicData>>> streamProductDetails();

  Stream<Either<Failure, List<ProductModel>>> fetchMostRatedProducts({
    required int limit,
  });

  Future<Either<Failure, void>> addFavorites(
      {required ProductModel productModel});

  Future<Either<Failure, void>> removeFavorites(
      {required ProductModel productModel});

  Future<Either<Failure, void>> addToCart(
      {required ProductModel productModel, required String? selectedSize});

  Future<Either<Failure, void>> removeFromCart({
    required ProductModel productModel,
  });

  Future<Either<Failure, int>> updateQuantity(
      {required ProductModel productModel, required bool increase});

  Future<Either<Failure, void>> uploadUserimage({required ImageSource source});

  Future<Either<Failure, void>> uploadUserDetails({
    required String name,
    required String phone,
    required String address,
  });
}
