import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class  ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key,
    this.width= 120,
    this.isResponsive=false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive==true?double.infinity:width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor
        ),
        child: Row(
          mainAxisAlignment: isResponsive== true? MainAxisAlignment.spaceAround: MainAxisAlignment.center,
          children: [
            isResponsive==true?AppText(text: 'Book Trip Now', color: Colors.white,):Container(),
            Icon(Icons.subdirectory_arrow_right,
            color: Colors.white,)
          ],
            
        ),
      ),
    );
  }
}
