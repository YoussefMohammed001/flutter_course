import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/core/cubits/language/language_cubit.dart';
import 'package:flutter_course/core/cubits/language/language_state.dart';
import 'package:flutter_course/core/routing/route_services.dart';
import 'package:flutter_course/core/shared_preferences/my_shared.dart';
import 'package:flutter_course/core/styles/themes.dart';
import 'package:flutter_course/generated/l10n.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

final appNavKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override

  void initState() {
    super.initState();
    Intl.defaultLocale = MyShared.getCurrentLanguage();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(390, 844),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp(
                navigatorObservers: [ChuckerFlutter.navigatorObserver], // Add this line
                navigatorKey: appNavKey,
                key: ValueKey(MyShared.getCurrentLanguage()),
                locale: Locale(MyShared.getCurrentLanguage()),
                supportedLocales: S.delegate.supportedLocales,
                localizationsDelegates: const [
                  S.delegate,  // App localization
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                builder: EasyLoading.init(),
                title: 'Flutter Course',
                debugShowCheckedModeBanner: false,
                theme: appTheme(),  // Light theme
                darkTheme: appDarkTheme(),  // Dark theme
                themeMode: (state is ChangeThemeState)
                    ? state.themeMode
                    : MyShared.getThemeMode(),  // Use saved theme mode
                onGenerateRoute: RouteServices.generateRoute,
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


}