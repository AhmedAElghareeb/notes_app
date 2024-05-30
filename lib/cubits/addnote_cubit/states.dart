part of 'cubit.dart';

class AddNotesStates {}

class AddNotesLoadingState extends AddNotesStates {}

class AddNotesSuccessState extends AddNotesStates {}

class AddNotesFailedState extends AddNotesStates {
  final String msg;

  AddNotesFailedState(this.msg);
}
