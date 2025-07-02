library export;

import 'dart:io' show HttpStatus;

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/browser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project/data/datasources/remote/retrofit_client.dart';
import 'package:flutter_demo_project/domain/model/user_model.dart';
import 'package:get_it/get_it.dart';

import 'app_constants.dart';

part '../presentation/screens/user_screen.dart';

part '../presentation/screens/splash_screen.dart';

part '../core/resources/locator.dart';

part '../core/resources/data_state.dart';

part '../data/repository/api_repository_impl.dart';

part '../domain/repository/api_repository.dart';

part '../data/repository/base/base_api_repository.dart';

part '../presentation/blocs/state/user_state.dart';

part '../presentation/blocs/event/user_event.dart';

part '../presentation/blocs/user_bloc.dart';
