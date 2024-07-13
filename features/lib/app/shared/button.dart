import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../core/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({required this.onPressed, required this.label, this.loading = false, super.key});

  final VoidCallback onPressed;
  final String label;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final colors = context.read<AppColors>();
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 40,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: colors.buttonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: colors.white,
              ),
            ),
            if (loading)
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(colors.white),
                    strokeWidth: 1.5,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
