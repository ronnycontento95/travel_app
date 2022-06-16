import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/response_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  int gottenStars = 4;
  int selectIndex=-1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          DetailState detail = state as DetailState;
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                      left: 0,
                      right: 0,
                      child: Container(
                        width: double.infinity,
                        height: 350,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "http://mark.bslmeiyu.com/uploads/"+detail.places.img),
                                fit: BoxFit.cover)),
                      )),
                  Positioned(
                      left: 20,
                      top: 70,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<AppCubits>(context).goHome();
                            },
                            icon: Icon(Icons.menu),
                            color: Colors.white,
                          )
                        ],
                      )),
                  Positioned(
                      top: 330,
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                        width: MediaQuery.of(context).size.width,
                        height: 500,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppLargeText(text: detail.places.name, color: Colors.black.withOpacity(0.8),),
                                AppLargeText(text: "\$"+detail.places.price.toString(), color: AppColors.mainColor,),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.location_on, color: AppColors.mainColor,),
                                SizedBox(height: 5,),
                                AppText(text: detail.places.location, color: AppColors.textColor1),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Wrap(
                                  children: List.generate(5, (index){
                                    return Icon(Icons.star, color: index<detail.places.stars? AppColors.startColor:AppColors.textColor2,);
                                  }),
                                ),
                                SizedBox(width: 10,),
                                AppText(text: "(5.0)", color: AppColors.textColor1,)
                              ],
                            ),
                            SizedBox(height: 25,),
                            AppText(text: "People", color: Colors.black.withOpacity(0.8),
                              size: 20,),
                            SizedBox(height: 5,),
                            AppText(text: 'Number of people in your group', color: AppColors.mainColor,),
                            Wrap(
                              children: List.generate(5, (index) {
                                return InkWell(
                                  onTap: (){
                                    setState(() {
                                      selectIndex=index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    child: AppButtons(
                                      color:  selectIndex==index? Colors.white:Colors.black,
                                      backgroundColor:selectIndex==index? Colors.black: AppColors.buttonBackground,
                                      size: 50,
                                      borderColor: selectIndex==index? Colors.black: AppColors.buttonBackground,
                                      text: (index+1).toString(),

                                    ),
                                  ),
                                );
                              }),
                            ),
                            SizedBox(height: 20,),
                            AppLargeText(text: 'Description', color: Colors.black.withOpacity(0.8),),
                            SizedBox(height: 20,),
                            AppText(text: detail.places.description,
                              color: AppColors.textColor2 ,
                            )
                          ],
                        ),
                      )),
                  Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: Row(
                        children: [
                          AppButtons(
                            size: 60,
                            color: AppColors.textColor2,
                            backgroundColor: Colors.white,
                            borderColor: AppColors.textColor1,
                            isIcon: true,
                            icon: Icons.favorite_border,
                          ),
                          SizedBox(width: 20,),
                          ResponsiveButton(
                            isResponsive: true,
                          )
                        ],

                      ))
                ],
              ),
            ),
          );
        });
  }
}
