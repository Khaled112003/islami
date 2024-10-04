import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerVideoWithText extends StatelessWidget {
  const ShimmerVideoWithText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder for the video
          Container(
            width: double.infinity,
            height: 200, // يمكنك تغيير الحجم حسب الحاجة
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 10),
          // Placeholder for the text
          Container(
            width: 150, // يمكن تحديد عرض النص الوهمي
            height: 20,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 5),
          // Placeholder for additional text or content
          Container(
            width: 100,
            height: 20,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}