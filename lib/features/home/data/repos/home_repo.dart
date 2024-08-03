import 'package:dartz/dartz.dart';
import 'package:swift_mart/core/errors/failures.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> fetchProducts();

  Future<Either<Failure, void>> addFavorites(
      {required ProductModel productModel});

  Future<Either<Failure, void>> removeFavorites(
      {required ProductModel productModel});

  Future<Either<Failure, void>> addToCart({required ProductModel productModel});
  Future<Either<Failure, void>> removeFromCart(
      {required ProductModel productModel});
}
