import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GetPlatform.isAndroid ? const CircularProgressIndicator() : const CupertinoActivityIndicator();
  }
}