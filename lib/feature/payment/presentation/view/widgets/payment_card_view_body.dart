import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:simplepaymentcard/core/utils/styles/style.dart';
import 'package:simplepaymentcard/feature/payment/presentation/view/widgets/build_card_item.dart';
import 'package:simplepaymentcard/feature/payment/presentation/view/widgets/build_expiry_date_item.dart';

import 'package:simplepaymentcard/feature/payment/presentation/view/widgets/custom_text.dart';
import 'package:simplepaymentcard/feature/payment/presentation/view/widgets/custom_textfeild.dart';
import 'package:simplepaymentcard/feature/payment/presentation/view_model/card_controller.dart';

class PaymentCardViewBody extends StatelessWidget {
  PaymentCardViewBody({super.key});
  final CardController cardController = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              BuildCardItem(),
              const SizedBox(height: 30),
              const CustomText(text: "Card Holder Name"),
              const SizedBox(height: 4),
              CustomTextFeild(
                text: "Enter Your Card Holder Name",
                onChanged: (value) {
                  cardController.updateCardHolderName(value);
                },
              ),
              const SizedBox(height: 40),
              const CustomText(text: "Card Number"),
              const SizedBox(height: 4),
              CustomTextFeild(
                text: "Enter Your Card Number",
                maxLength: 16,
                onChanged: (value) {
                  cardController.updateCardNumber(value);
                },
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: BuildExpiryDateTxtField(
                      cardController: cardController,
                    ),
                  ),
                  const Spacer(flex: 4),
                  SizedBox(
                    width: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                            alignment: Alignment.center,
                            child: CustomText(text: "CVV")),
                        const SizedBox(height: 4),
                        CustomTextFeild(
                          maxLength: 3,
                          onChanged: (value) {
                            cardController.updateCvv(value);
                          },
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 3),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    cardController.saveCardData();
                  },
                  child: const Text(
                    "Save Card",
                    style: AppStyles.textStyle24,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ]),
          ),
        ],
      ),
    );
  }
}
