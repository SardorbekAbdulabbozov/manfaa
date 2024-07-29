import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manfaa/components/global_variables.dart';
import 'package:manfaa/core/config/router/router.dart';
import 'package:manfaa/core/dependency/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setUpDependencies();
  runApp(
    EasyLocalization(
      path: 'lib/core/config/localization',
      supportedLocales: const [
        Locale("en"),
        Locale("uz"),
        Locale("ru"),
      ],
      fallbackLocale: const Locale("en"),
      startLocale: Locale(storageService.getLocale()),
      child: const Manfaa(),
    ),
  );
}

class Manfaa extends StatelessWidget {
  const Manfaa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Manfaa',
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
        )
      ),
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
