import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  const Mytextfield({super.key, this.controller, this.hintText, this.labelText, this.obsecureText, this.validator});

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool? obsecureText;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText?? false,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary
        ),
        fillColor: Theme.of(context).colorScheme.secondary,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          )
        )
      ),
    );
  }
}