
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../presentation/widgets/navigators.dart';

leadingIcon(BuildContext context) {
  return InkWell(
      onTap: () => navigatePop(context),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: Center(child: Icon(Icons.arrow_back_ios,size: 20,)),
      ));
}

mainTheme(BuildContext context){
  Color mainTheme = Theme.of(context).primaryColor;
  return mainTheme;
}

leadingIconGrey(BuildContext context) {
  return InkWell(
    onTap: () => navigatePop(context),
    child: Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          color: Color(0xffeaeef2),
          borderRadius: BorderRadius.circular(10000)),
      child: Center(
        child: Icon(CupertinoIcons.back),
      ),
    ),
  );
}
