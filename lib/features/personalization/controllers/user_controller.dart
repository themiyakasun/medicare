import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:medicare/common/widgets/loaders.dart';
import 'package:medicare/data/repositories/user/user_repository.dart';
import 'package:medicare/features/personalization/models/user_model.dart';
import 'package:medicare/utils/constants/enums.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    }
  }

  Future<void> saveUserRecord(
      UserCredential? userCredentials, AppRole? role) async {
    try {
      if (userCredentials != null) {
        final user = UserModel(
            id: userCredentials.user!.uid,
            name: userCredentials.user!.displayName ?? '',
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
            role: role ?? AppRole.patient,
            createdAt: DateTime.now());

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
