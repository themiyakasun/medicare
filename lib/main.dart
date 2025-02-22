import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medicare/bindings/general_bindings.dart';
import 'package:medicare/data/repositories/authentication/authentication_repository.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/theme/theme.dart';
import 'firebase_options.dart';

void main() async {
  //Widget binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //Get local storage
  await GetStorage.init();

  //Await splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.theme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: TColors.dartPurpleNeutral,
        body: Center(
          child: CircularProgressIndicator(
            color: TColors.neutralsWhite,
          ),
        ),
      ),
    );
  }
}
