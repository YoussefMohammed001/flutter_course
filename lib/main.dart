import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/app.dart';
import 'package:flutter_course/core/di/di.dart';
import 'package:flutter_course/core/network/api_service.dart';
import 'package:flutter_course/core/shared_preferences/my_shared.dart';
import 'package:flutter_course/myy_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiService.init();
  MyShared.init();
  setupGetIt();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());

}
