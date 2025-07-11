import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simplepaymentcard/core/services/firebase_services.dart';
import 'package:simplepaymentcard/core/utils/colors/colors.dart';

class CardController extends GetxController {
  RxString cardHolderName = 'Kathryn Murphy'.obs;
  RxString cardNumber = '0000 0000 0000 0000'.obs;
  RxString expiryDate = '04/28'.obs;
  RxString cvv = ''.obs;

  RxString assetImagePath = 'assets/images/profile_img.png'.obs;
  RxString fileImagePath = ''.obs;

  FirebaseServices firebaseServices = FirebaseServices();

  void updateCardHolderName(String name) {
    cardHolderName.value = name;
  }

  void updateCardNumber(String number) {
    cardNumber.value = number;
  }

  void updateExpiryDate(String date) {
    expiryDate.value = date;
  }

  void updateCvv(String cvvCode) {
    cvv.value = cvvCode;
  }

  void saveCardData() {
    if (cardHolderName.value.isEmpty ||
        cardNumber.value.isEmpty ||
        expiryDate.value.isEmpty ||
        cvv.value.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields",
          snackPosition: SnackPosition.BOTTOM);
      return;
    } else {
      firebaseServices
          .addPaymentMethods(
        cardHolderName.value,
        cardNumber.value,
        expiryDate.value,
        cvv.value,
        fileImagePath.value,
      )
          .then((value) {
        Get.snackbar("Success", "Card added successfully",
            snackPosition: SnackPosition.BOTTOM,colorText: AppColors.teracotta);
           
      }).catchError((error) {
        Get.snackbar("Error", "Failed to add card: $error",
            snackPosition: SnackPosition.BOTTOM);
      });
    }
  }

  Future<dynamic> pickProfileImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      fileImagePath.value = pickedFile.path;
    } else {
      Get.snackbar("Error", "No image selected",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
  }

  Future<dynamic> pickProfileImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      fileImagePath.value = pickedFile.path;
    } else {
      Get.snackbar("Error", "No image captured",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
  }
}