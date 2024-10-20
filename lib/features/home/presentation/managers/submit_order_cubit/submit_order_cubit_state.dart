part of 'submit_order_cubit_cubit.dart';

@immutable
sealed class SubmitOrderCubitState {}

final class SubmitOrderCubitInitial extends SubmitOrderCubitState {}

final class SubmitOrderCubitLoading extends SubmitOrderCubitState {}

final class SubmitOrderCubitSuccess extends SubmitOrderCubitState {}

final class SubmitOrderCubitFailed extends SubmitOrderCubitState {
  final String errorMessage;

  SubmitOrderCubitFailed({required this.errorMessage});
}
