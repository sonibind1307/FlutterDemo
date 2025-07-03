part of '../../../core/export.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchUsers extends UserEvent {}

class SwipeToRefresh extends UserEvent {}

class LoadUsersFromCache extends UserEvent {}

class SearchUsers extends UserEvent {
  final String query;

  SearchUsers({required this.query});

  @override
  List<Object?> get props => [query];
}
