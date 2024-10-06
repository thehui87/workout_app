import 'package:flutter/material.dart';

// StylizedTextField Usage of ColorChangingTextField
class StylizedTextField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final String labelText;
  final bool isPassword;

  StylizedTextField({
    super.key,
    required this.labelText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return ColorChangingTextField(
      controller: _controller,
      obscureText: isPassword,
      labelText: labelText,
      decoration: InputDecoration(
        labelText: 'Enter text',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      ),
    );
  }
}

// Custom ColorChangingTextField Widget
class ColorChangingTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final InputDecoration decoration;
  final String labelText;

  const ColorChangingTextField({
    super.key,
    required this.controller,
    this.obscureText = false,
    required this.decoration,
    required this.labelText,
  });

  @override
  ColorChangingTextFieldState createState() => ColorChangingTextFieldState();
}

class ColorChangingTextFieldState extends State<ColorChangingTextField> {
  final FocusNode _focusNode = FocusNode();
  late Color _labelColor; // Declare without initialization
  late bool _isObscure; // State for password visibility

  @override
  void initState() {
    super.initState();
    _labelColor = Colors.grey; // Set initial label color
    _isObscure = widget.obscureText; // Initialize obscureTex

    _focusNode.addListener(() {
      setState(() {
        // Change label color based on focus and input
        if (_focusNode.hasFocus || widget.controller.text.isNotEmpty) {
          _labelColor = Theme.of(context).primaryColor; // Focused or not empty
        } else {
          _labelColor = Colors.grey; // Default color
        }
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _toggleObscureText() {
    setState(() {
      _isObscure = !_isObscure; // Toggle obscure state
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      obscureText: _isObscure,
      decoration: widget.decoration.copyWith(
        labelStyle: TextStyle(color: _labelColor),
        labelText: widget.labelText,

        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: _toggleObscureText, // Toggle visibility
              )
            : null,
        border: InputBorder.none, // Removes the default border
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .primary), // Border color when enabled
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .primary), // Border color when focused
        ),
      ),
    );
  }
}
