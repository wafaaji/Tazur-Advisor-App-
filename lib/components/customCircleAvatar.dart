import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String imagePath;
  final double radius;
  final String placeholderAssetPath;

  CustomCircleAvatar({
    required this.imagePath,
    required this.radius,
    this.placeholderAssetPath = 'assets/images/default_avatar.png', // Default asset image path
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey.shade200,
      child: ClipOval(
        child: Image.network(
          imagePath,
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              placeholderAssetPath,
              width: radius * 2,
              height: radius * 2,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
