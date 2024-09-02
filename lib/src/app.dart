import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opentripapp/di/main_bindings.dart';
import 'package:opentripapp/features/trip/ui/list/trip_list_screen.dart';
import 'settings/settings_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          color: Colors.white,
          debugShowCheckedModeBanner: false,
          initialBinding: MainBindings(),
          transitionDuration: const Duration(milliseconds: 300),
          defaultTransition: GetPlatform.isAndroid
              ? Transition.rightToLeftWithFade
              : Transition.native,
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],
          theme: ThemeData(canvasColor: Colors.white),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          initialRoute: "/",
          getPages: [GetPage(name: "/", page: () => const TripListScreen())],
        );
      },
    );
  }
}
