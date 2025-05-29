import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medicare/features/authentication/screen/login/login.dart';
import 'package:medicare/features/authentication/screen/onboarding/onboarding.dart';
import 'package:medicare/features/authentication/screen/signup/verify_email.dart';
import 'package:medicare/features/personalization/controllers/user_controller.dart';
import 'package:medicare/navigation_menu_dcotor.dart';
import 'package:medicare/navigation_menu_patient.dart';
import 'package:medicare/utils/constants/enums.dart';
import 'package:medicare/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:medicare/utils/exceptions/firebase_exceptions.dart';
import 'package:medicare/utils/exceptions/format_exceptions.dart';
import 'package:medicare/utils/exceptions/platform_exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect([AppRole? role]) async {
    final user = _auth.currentUser;
    print(
        'ScreenRedirect: Current auth user: ${user?.email}, Passed role: $role');

    if (user != null) {
      AppRole finalRole;

      if (role != null) {
        finalRole = role;
        print('ScreenRedirect: Using passed role: $finalRole');
      } else {
        try {
          final userController = Get.isRegistered<UserController>()
              ? Get.find<UserController>()
              : Get.put(UserController());

          if (userController.user.value.id.isEmpty ||
              userController.user.value.id != user.uid) {
            await userController.fetchUserRecord();
          }

          if (userController.user.value.id.isNotEmpty) {
            finalRole = userController.user.value.role;
            print(
                'ScreenRedirect: Fetched role from UserController: $finalRole');
          } else {
            print(
                'ScreenRedirect: Could not fetch user record from UserController, defaulting to patient for redirection logic.');
            finalRole = AppRole.patient;
          }
        } catch (e) {
          print(
              'ScreenRedirect: Error fetching role from UserController: $e. Defaulting to patient.');
          finalRole = AppRole.patient;
        }
      }

      if (user.emailVerified) {
        if (finalRole == AppRole.doctor) {
          print('Redirecting to NavigationMenuDoctor');
          Get.offAll(() => const NavigationMenuDoctor());
        } else {
          print('Redirecting to NavigationMenuPatient');
          Get.offAll(() => const NavigationMenuPatient());
        }
      } else {
        print('Redirecting to VerifyEmailScreen');
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      print('Redirecting to Onboarding or Login');
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnBoardingScreen());
    }
  }

  //Email and password sign in
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Register
  Future<UserCredential> registerWithEmailandPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong. Please try again';
    }
  }

  //Email Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong. Please try again';
    }
  }

  //Sign in with google
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong. Please try again';
    }
  }

  //Logout User
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
