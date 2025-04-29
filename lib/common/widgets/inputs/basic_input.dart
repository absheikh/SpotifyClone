import 'package:flutter/material.dart';

class BasicInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isEmail;
  final bool isPassword;
  final bool isRequired;

  const BasicInput({
    super.key,
    required this.controller,
    required this.hintText,
    this.isEmail = false,
    this.isPassword = false,
    this.isRequired = false
  });

  @override
  State<BasicInput> createState() => _BasicInputState();
}

class _BasicInputState extends State<BasicInput> {
  String? errorText;
  bool isObscured = true; // for password visibility toggle

  void validateInput(String value) {
    if (widget.isRequired && value.trim().isEmpty) {
      setState(() {
        errorText = "${widget.hintText} is required";
      });
      return;
    }

    if (widget.isEmail) {
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(value)) {
        setState(() {
          errorText = "Invalid email address";
        });
        return;
      }
    }

    setState(() {
      errorText = null;
    });
  }


  @override
  void initState() {
    super.initState();
    if (!widget.isPassword) {
      isObscured = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          obscureText: isObscured,
          onChanged: validateInput,
          decoration: InputDecoration(
            hintText: widget.hintText,
            errorText: errorText,
            suffixIcon: widget.isPassword
                ? Padding(
                  padding: const EdgeInsets.only(right:20),
                  child: IconButton(
                                icon: Icon(
                  isObscured ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                                ),
                                onPressed: () {
                  setState(() {
                    isObscured = !isObscured;
                  });
                                },
                              ),
                )
                : null,
          ).applyDefaults(Theme.of(context).inputDecorationTheme),
        ),
      ],
    );
  }
}
