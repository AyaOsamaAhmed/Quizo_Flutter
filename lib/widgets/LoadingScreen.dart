import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utilities/theme_helper.dart';

class LoadingScreen extends StatelessWidget {
  final Widget child;
  final bool loading;
  const LoadingScreen({Key? key, required this.child,this.loading = false,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          child,
          if(loading) Positioned.fill(
            child: Container(
              color: ThemeClass.of(context).mainBlack.withOpacity(.2),
            ),
          ),
          if(loading) Positioned(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child:  CupertinoActivityIndicator(
                radius: 25,
                color: ThemeClass.of(context).secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
