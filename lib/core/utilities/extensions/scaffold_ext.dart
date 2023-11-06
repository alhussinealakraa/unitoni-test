import 'package:flutter/material.dart';

extension ScaffoldUtils on Scaffold{
  Widget disposeKey(BuildContext context){
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: SafeArea(
          top: false,
          left: false,
          bottom: true,
          right: false,
          child: this),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}