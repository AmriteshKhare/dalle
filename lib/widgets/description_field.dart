import 'package:flutter/material.dart';

class DescriptionField extends StatefulWidget {
  final bool _isGenerating;
  final void Function(String prompt) _onSubmitted;
  const DescriptionField(
      {super.key,
      required bool isGenerating,
      required Function(String value) onSubmitted})
      : _isGenerating = isGenerating,
        _onSubmitted = onSubmitted;

  @override
  State<DescriptionField> createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends State<DescriptionField> {
  final _descController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _descController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _descController,
      focusNode: _focusNode,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: 'HERE',
        suffixIcon: IconButton(
          splashRadius: 20,
          color: Color.fromRGBO(0, 0, 0, 1),
          onPressed: widget._isGenerating
              ? null
              : () {
                  _focusNode.unfocus();
                  final desc = _descController.text;
                  _descController.clear();
                  widget._onSubmitted(desc);
                },
          icon: const Icon(
            Icons.send,
          ),
        ),
      ),
    );
  }
}
