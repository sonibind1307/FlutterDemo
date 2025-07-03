part of '../../../core/export.dart';

abstract class ConnectionEvent {}

class ConnectionLost extends ConnectionEvent {}

class ConnectionGained extends ConnectionEvent {}