import 'package:flutter/material.dart';
import 'package:rest_api_mvvp/resources/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback onPress;
  const RoundButton({
    super.key,
    required this.title,
    this.isLoading = false,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.buttonColor,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: AppColor.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
