part of 'check_available_quantity_cubit.dart';

@immutable
sealed class CheckAvailableQuantityState {}

final class CheckAvailableQuantityInitial extends CheckAvailableQuantityState {}

final class CheckAvailableQuantityLoading extends CheckAvailableQuantityState {}

final class CheckAvailableQuantitySuccess extends CheckAvailableQuantityState {}

final class CheckAvailableQuantityFailed extends CheckAvailableQuantityState {
  final String errorMessage;

  CheckAvailableQuantityFailed({required this.errorMessage});
}
