import 'package:get/get.dart';
import 'package:medicare/common/widgets/loaders.dart';
import 'package:medicare/data/repositories/rating/rating_repository.dart';

class RatingController extends GetxController {
  static RatingController get instance => Get.find();

  final isLoading = false.obs;
  final ratingRepository = Get.put(RatingRepository());

  Future<double> fetchAverageRating(String doctorId) async {
    try {
      isLoading.value = true;
      final result = await ratingRepository.fetchRatings(doctorId);

      if (result.isNotEmpty) {
        final total = result.map((r) => r.rating).reduce((a, b) => a + b);
        final average = total / result.length;
        return average;
      } else {
        return 0.0;
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return 0.0;
    } finally {
      isLoading.value = false;
    }
  }
}
