import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.emailCtrl,
    required this.title,
    required this.label,
    required this.alternateButton2Text,
    required this.validator,
    this.alternateWidget1,
  });

  final TextEditingController emailCtrl;
  final String title;
  final String label;
  final String alternateButton2Text;
  final String? Function(String?)? validator;
  final Widget? alternateWidget1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 6),
            child: Text(
              title,
              style: const TextStyle(fontSize: 18.5),
            ),
          ),
        ),
        TextFormField(
          controller: emailCtrl,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(fontSize: 16),
            border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: validator,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            alternateWidget1 ?? const SizedBox.shrink(),
            Padding(
              padding: EdgeInsets.only(top: alternateWidget1 == null ? 10 : 0, right: 10),
              child: Text(
                alternateButton2Text,
                style: TextStyle(color: Colors.lightBlue[800], fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
