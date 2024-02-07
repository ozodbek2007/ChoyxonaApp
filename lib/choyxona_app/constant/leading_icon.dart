
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