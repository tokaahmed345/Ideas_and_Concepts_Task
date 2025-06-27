import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simplepaymentcard/feature/payment/presentation/view/widgets/custom_text.dart';
import 'package:simplepaymentcard/feature/payment/presentation/view/widgets/custom_textfeild.dart';
import 'package:simplepaymentcard/feature/payment/presentation/view_model/card_controller.dart';

class BuildExpiryDateTxtField extends StatelessWidget {
  const BuildExpiryDateTxtField({super.key, this.cardController});
  final CardController? cardController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(text: "Expiry Date"),
        const SizedBox(height: 4),
        CustomTextFeild(
          maxLength: 5,
          onChanged: (value) {
            cardController?.updateExpiryDate(value);
          },
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
            LengthLimitingTextInputFormatter(5),
            TextInputFormatter.withFunction((oldValue, newValue) {
              var text = newValue.text;
              if (text.length == 2 && !text.contains('/')) {
                text = '$text/';
              }
              return TextEditingValue(
                text: text,
                selection: TextSelection.collapsed(offset: text.length),
              );
            }),
          ],
          buildCounter: (BuildContext context,
              {int? currentLength, bool? isFocused, int? maxLength}) {
            return const Text('MM/YY');
          },
        ),
      ],
    );
  }
}
