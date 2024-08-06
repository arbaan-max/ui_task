import 'package:flutter/material.dart';
import 'package:task_validation/constants/custome_colors.dart';

/// A custom form field widget that provides additional styling and configuration.
class CustomFormField extends StatelessWidget {
  final String title; // The label text for the form field
  final String hintText; // The hint text displayed in the form field
  final TextEditingController controller; // Controller to manage the form field's text
  final String? Function(String?)? validator; // Validation function for the form field
  final TextInputType keyboardType; // Keyboard type for the form field
  final bool isPassword; // Whether the field is for password input
  final int maxLines; // Maximum number of lines for the form field

  const CustomFormField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // The label text for the form field
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        // The text form field with custom styling
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: CustomColors.grey,
                ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: CustomColors.textFieldBorder),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          validator: validator,
          keyboardType: keyboardType,
          obscureText: isPassword,
          maxLines: maxLines,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

/// A custom radio button widget with a label.
class RadioOption extends StatelessWidget {
  final String label; // The label text for the radio button
  final String value; // The value associated with this radio button
  final String groupValue; // The current value of the radio group
  final ValueChanged<String?> onChanged; // Callback when the radio button is changed

  const RadioOption({
    super.key,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // The radio button itself
        Radio<String>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: CustomColors.primary,
        ),
        // The label text for the radio button
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: CustomColors.grey,
              ),
        ),
      ],
    );
  }
}
