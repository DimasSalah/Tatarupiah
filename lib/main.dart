import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'app/data/global_controller/user_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/style/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
  await GetStorage.init();
  await initializeDateFormatting('id_ID', null);
  Intl.defaultLocale = 'id_ID';
  Get.put(UserController(), permanent: true);
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.themeData,
      locale: const Locale('id', 'ID'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('id', 'ID'),
      ],
    ),
  );
}
