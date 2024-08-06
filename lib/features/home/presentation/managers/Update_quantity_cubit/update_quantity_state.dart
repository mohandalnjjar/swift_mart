part of 'update_quantity_cubit.dart';

@immutable
sealed class UpdateQuantityState {}

final class UpdateQuantityInitial extends UpdateQuantityState {}

final class UpdateQuantityLoading extends UpdateQuantityState {}

final class UpdateQuantitySuccess extends UpdateQuantityState {
  final int quantity;

  UpdateQuantitySuccess({required this.quantity});
}

final class UpdateQuantityFailed extends UpdateQuantityState {
  final String errorMessage;

  UpdateQuantityFailed({required this.errorMessage});
}
