import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:manfaa/core/storage/storage.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

final rootKey = GlobalKey<NavigatorState>();

final injector = GetIt.instance;

final storageService = injector<Storage>();
