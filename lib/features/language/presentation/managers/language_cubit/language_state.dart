part of 'language_cubit.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageLoading extends LanguageState {}

class LanguageChangeDone extends LanguageState {}

class GetLanguageDone extends LanguageState {}

class LanguageFailed extends LanguageState {
  String errorMeassage;

  LanguageFailed({required this.errorMeassage});
}
