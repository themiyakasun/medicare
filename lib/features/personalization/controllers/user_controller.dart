import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:medicare/common/widgets/loaders.dart';
import 'package:medicare/data/repositories/user/user_repository.dart';
import 'package:medicare/features/personalization/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final user = UserModel(
            id: userCredentials.user!.uid,
            name: userCredentials.user!.displayName ?? '',
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '');

        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something wrong with your information. You can resave your data in your profile');
    }
  }
}
