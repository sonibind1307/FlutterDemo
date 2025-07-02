part of export;

abstract class UserState {}

class InitialUserState extends UserState {}

class LoadingUserState extends UserState {}

class ErrorUserState extends UserState {}

class SuccessUserState extends UserState {}
