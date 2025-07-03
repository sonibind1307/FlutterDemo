library export;

import 'dart:async';
import 'dart:io' show HttpStatus;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_project/core/helper.dart';
import 'package:flutter_demo_project/core/route/router_constant.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project/data/datasources/remote/retrofit_client.dart';
import 'package:flutter_demo_project/domain/model/user_model.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

import 'package:flutter_screenutil/src/size_extension.dart';

import '../presentation/widgets/custom_text_style.dart';
import 'app_constants.dart';

part '../presentation/widgets/circle_avatar_widget.dart';

part '../presentation/screens/user_screen.dart';

part '../presentation/screens/user_detail_screen.dart';

part '../presentation/screens/splash_screen.dart';

part '../core/resources/locator.dart';

part '../core/resources/data_state.dart';

part '../data/repository/api_repository_impl.dart';

part '../domain/repository/api_repository.dart';

part '../data/repository/base/base_api_repository.dart';

part '../presentation/bloc_logic/state/user_state.dart';

part '../presentation/bloc_logic/state/connection_state.dart';

part '../presentation/bloc_logic/event/user_event.dart';

part '../presentation/bloc_logic/event/connection_event.dart';

part '../presentation/bloc_logic/bloc/user_bloc.dart';

part '../presentation/bloc_logic/bloc/connection_bloc.dart';

part 'route/router.dart';
