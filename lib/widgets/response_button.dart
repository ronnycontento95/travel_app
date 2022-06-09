import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';

class  ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key,
    this.width,
    this.isResponsive=false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.subdirectory_arrow_right,
          color: AppColors.textColor2,)
        ],
          
      ),
    );
  }
}
