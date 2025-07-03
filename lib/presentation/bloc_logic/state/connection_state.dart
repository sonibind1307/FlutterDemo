part of '../../../core/export.dart';

abstract class ConnectionState {}

class ConnectionInitial extends ConnectionState {}

class ConnectionSuccess extends ConnectionState {}

class ConnectionFailure extends ConnectionState {}