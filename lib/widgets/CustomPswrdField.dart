import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController? textFieldController;
  final int? maxlength;

  const PasswordField({
    super.key,
    required this.hintText,
    this.isPassword = true,
    this.keyboardType = TextInputType.text,
    this.textFieldController,
    this.maxlength,
  });

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,

      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F4F7), // Light pink color
        borderRadius: BorderRadius.circular(30), // Rounded corners
      ),
      child: Center(
        child: TextField(
          maxLength: widget.maxlength,
          maxLines: 1,
          controller: widget.textFieldController,
          obscureText: widget.isPassword ? _obscureText : false,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            counterText: '',
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Color(0xFF667085)),
            border: InputBorder.none,
            suffixIcon:
                widget.isPassword
                    ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xFF667085),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                    : null,
          ),
        ),
      ),
    );
  }
}
