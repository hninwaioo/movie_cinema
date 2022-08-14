import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
class PhoneNumberCodeSectionView extends StatelessWidget {
  const PhoneNumberCodeSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: IntlPhoneField(
            showDropdownIcon: true,
        dropdownIconPosition : IconPosition.trailing,
            decoration: InputDecoration(
              // labelText: 'Mobile Number',
              // border: OutlineInputBorder(
              //   borderSide: BorderSide(),
              // ),
            ),
            onChanged: (phone) {
              print(phone.completeNumber);
            },
            onCountryChanged: (country) {
              print('Country changed to: ' + country.name);
            },

          ),
        )
      ],
    );
  }
}
