import 'package:flutter/material.dart';
import 'constants.dart';

var enabledBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  borderSide: BorderSide(color: AppColors.greyScale7, width: 1.0),
);

const disabledBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16.0)),
  borderSide: BorderSide(color: Colors.grey, width: 1.0),
);

const focusedBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  borderSide: BorderSide(color: AppColors.primary1, width: 1.0),
);

const focusedErrorBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  borderSide: BorderSide(color: AppColors.danger, width: 1.0),
);

const inputLabelStyle = TextStyle(
  color: Colors.grey,
);

const floatingLabelStyle = TextStyle(
  color: AppColors.primary1,
);

const errorStyle = TextStyle(color: AppColors.primary1);
