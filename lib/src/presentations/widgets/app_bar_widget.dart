
import 'package:flutter/material.dart';

class AppAppBars extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final double size;
  final bool isForSubtitle;

  const AppAppBars({Key? key, required this.title, required this.size, required this.isForSubtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: size,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w600,
            letterSpacing: 0.32,
          ),
        ),

      actions: [
        isForSubtitle?
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black,size: 20,),
          onPressed: () {},
        ):
            SizedBox.shrink()
      ]
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
