import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';

class SquaredButton extends StatelessWidget {
  const SquaredButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: cinemaBrand,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      child: Text(label),
    );
  }
}