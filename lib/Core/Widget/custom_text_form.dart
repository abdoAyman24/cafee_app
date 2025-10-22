import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm({
    super.key,
    required this.header,
    required this.hint,
    required this.onSave,
    this.showSuffixIcon = false,
    required this.keyboardType,
  });
  final String header;
  final String hint;
  final ValueChanged onSave;
  final bool showSuffixIcon;
  final TextInputType keyboardType;

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  bool showPasword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.header, style: AppText.bold18),
          const SizedBox(height: 8),
          TextFormField(
            onChanged: widget.onSave,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Field is Empty ';
              }
              return null;
            },
            style: TextStyle(color: Colors.black),
            keyboardType: widget.keyboardType,
            obscureText: !widget.showSuffixIcon
                ? false
                : showPasword
                ? false
                : true,
            decoration: InputDecoration(
              suffixIcon: widget.showSuffixIcon
                  ? IconButton(
                      onPressed: () {
                        showPasword = !showPasword;
                        setState(() {});
                      },
                      icon: Icon(
                        showPasword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.grey,
                      ),
                    )
                  : null,
              hint: Text(
                widget.hint,
                style: TextStyle(color: const Color(0xFFC4C4C4)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
