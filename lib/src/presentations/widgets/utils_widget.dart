
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Src/utils/consts/app_specifications/app_colors.dart';
import '/src/utils/consts/app_specifications/app_dimensions.dart';


class UtilsWidget{
  Container choiceBarSelection(double widthSize,
      {
        required VoidCallback action1,
        required VoidCallback action2,
        required bool boolVarIsHere,
        required String title1,
        required String title2,
      })
  {
    return Container(
      height:70,
      width: double.infinity,
     // margin: const EdgeInsets.only(top: 15,),
      margin: const EdgeInsets.fromLTRB(10 , 15, 10, 10),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: action1,
            child: Container(
              width: widthSize,
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 16),
              decoration: ShapeDecoration(
                color: boolVarIsHere? const Color(0x19009EE0):null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(title1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:boolVarIsHere? AppColors.lightBlueColor:const Color(0xFF465668) ,
                  fontSize: 14,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: action2,
            child: Container(
                width:widthSize,
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 16),
                decoration: ShapeDecoration(
                  color: boolVarIsHere?null: const Color(0x19009EE0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                child: Text(title2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: boolVarIsHere?const Color(0xFF465668):AppColors.lightBlueColor,
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
  Container detailContainer({required BuildContext context, required String nomChamps, required String values,required Color fondColor, required Color borderColor}){
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth10, AppDimensions.sizeboxHeight5, AppDimensions.sizeboxWidth10, AppDimensions.sizeboxHeight5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: borderColor),
          color: fondColor
         // color: Colors.white

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(nomChamps,
              style: const TextStyle(
                fontFamily: 'Roboto',
                color: Color(0xffb1b1b1),
                fontSize: 13,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                letterSpacing: 1,

              )
          ),
          Text(values,
              style:  TextStyle(
                fontFamily: 'Roboto',
                color: const Color(0xff484848),
                fontSize: MediaQuery.textScaleFactorOf(context)*15,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                letterSpacing: 1,

              )
          ),
        ],
      ),
    );
  }

  Container bottomNavBarTitle(double textScaleFactor,{
    required String icon,
    required String title,
    required bool condition,
}){
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
    decoration: BoxDecoration(
    color: condition? Colors.white:null,
    borderRadius: BorderRadius.circular(100),
    ),
    child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 6,
        children: [
          SizedBox(
            width: 13,
            height: AppDimensions.sizeboxHeight13,
            child: SvgPicture.asset("asset/images/$icon.svg",color:condition? Color(0xFF1F5DAB):Colors.grey,),
          ),
          Text(title,
            style: TextStyle(
              color: condition? Color(0xFF1F5DAB):Colors.grey,
              fontSize: textScaleFactor * 13,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              letterSpacing: 0.20,
            ),
          ),
        ],
      ),
      ),
    );
  }

  Container containerBoxForDashboard(double textScaleFactor,{
    required String title,
    required Color countColor,
    required int count,
  }){
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 7,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Container(
                    width: 30,
                    height: 30,
                    decoration: const ShapeDecoration(
                      color: Color(0xFFF2F5F9),
                      shape: OvalBorder(),
                    ),
                    child: Center(
                        child: Text('🏛',
                          style: TextStyle(fontSize: textScaleFactor*15,),
                        )
                    )
                ),
                Text(title,
                  style: TextStyle(
                    color: AppColors.mainTitleColor,
                    fontSize: textScaleFactor*16,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.24,
                  ),
                ),
              ],
            ),
            Text(count.toString(),
              style: TextStyle(
               color:countColor,
                fontSize: textScaleFactor*17,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.36,
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildTypeOfInfoRow(String title, VoidCallback action) {
    return GestureDetector(
      onTap: action,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[200]!,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
              style: const TextStyle(
                color: Color(0xFF333333),
                fontSize: 18,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.24,
              ),
            ),
            Container(
                width: 30,
                height: 30,
                decoration: const ShapeDecoration(
                  color: Color(0xFFF2F5F9),
                  shape: OvalBorder(),
                ),
                child: Icon(Icons.arrow_forward_ios,size: 18,)
            ),
          ],
        ),
      ),
    );
  }

 Container containerForPourcentageData({
    required String title,
    required int count,
    required Color countColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: Colors.white /* Color */,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 5,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 4,
            children: [
              Text(
                '$count%',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: countColor,
                  fontSize: 18,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.36,
                ),
              ),
              Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF7F8C8D),
                  fontSize: 14,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  InkWell cardForMenuSousMenuOrbus(BuildContext context,{
    required String title,
    required IconData icon,
    required VoidCallback action
  }) {
    return InkWell(
        onTap: action,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
              Container(
                width: 30,
                height: 30,
                decoration: const ShapeDecoration(
                  color: Color(0x19009EE0),
                  shape: OvalBorder(),
                ),
                child: Icon(
                  icon,
                  color: Colors.blue.shade300,
                  size: AppDimensions.sizeboxHeight15,),
              ),
              Text(title,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    //color: AppColors.homePageTitleOfElementOnCategoryContainerColor,
                    fontSize: MediaQuery.textScaleFactorOf(context)*16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,

                  )
              ),
            ],
          ),
        )
    );
  }
}
