part of '../../../core/export.dart';

abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialUserState extends UserState {}

class LoadingUserState extends UserState {}

class ErrorUserState extends UserState {
  final String error;

  ErrorUserState(this.error);

  @override
  List<Object?> get props => [error];
}

class SuccessUserState extends UserState {
  final List<UserModel> users;
  final bool isLoadingMore;

  SuccessUserState(this.users, {this.isLoadingMore = false});

  SuccessUserState copyWith({
    List<UserModel>? users,
    bool? isLoadingMore,
  }) {
    return SuccessUserState(
      users ?? this.users,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props => [users, isLoadingMore];
}
