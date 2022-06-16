import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/response_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  List images= [
  "welcome_one.jpg",
  "welcome_two.jpg",
  "welcome_three.jpg"

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                "assets/img/"+ images[index]
                ),
                fit: BoxFit.cover
              )
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 500, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Trips"),
                      AppText(text: "Montain", size: 30,),
                      SizedBox(height: 20,),
                      Container(
                        width: 250,
                        child: AppText(
                          text: "Mountain hikes give you an incredible of freedom along with endurance tests",
                          color: AppColors.mainColorLight,
                          size: 14,
                        ),
                      ),
                      SizedBox(height: 40,),
                      GestureDetector(
                        onTap: (){
                          BlocProvider.of<AppCubits>(context).getData();
                        },
                        child: Container(
                            width: 200,
                            child: Row(children:[ ResponsiveButton(width: 120,)])),
                      )
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indesDots) {
                      return Container(
                        width: 8,
                        height: index ==indesDots?25:8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == indesDots?AppColors.mainColor: AppColors.mainColor.withOpacity(0.3)
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
      }),
    );
  }
}
