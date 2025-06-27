
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplepaymentcard/feature/payment/presentation/view/widgets/build_profile_img.dart';

import 'package:simplepaymentcard/feature/payment/presentation/view/widgets/payment_card_view_body.dart';


class PaymentCardView extends StatelessWidget {

  const PaymentCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){Get.back(); }, icon: const Icon(Icons.arrow_back)),
      actions: [
Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: BuildProfileImg(),
    ),
      ],
        title: const Text(
          "Add Card",
        ),
      ),
      body: PaymentCardViewBody(),
    );
  }

 }
