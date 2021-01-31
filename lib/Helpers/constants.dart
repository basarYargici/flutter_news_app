import 'package:flutter/material.dart';

// news api key
const String API_KEY = "c4a567c5040a48729a65a35f9f30d9b8";

const TextStyle baseStyle = TextStyle(
  fontSize: 18,
  letterSpacing: 2,
  color: Colors.black,
);

final TextStyle appbarStyle1 = baseStyle.copyWith(
  fontSize: 18,
  color: Colors.black54,
  fontWeight: FontWeight.bold,
);

final TextStyle appbarStyle2 = baseStyle.copyWith(
  fontSize: 24,
  color: Colors.blue,
  fontWeight: FontWeight.bold,
);

final TextStyle categoryStyle = baseStyle.copyWith(
  fontSize: 10,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

final TextStyle titleStyle = baseStyle.copyWith(
  fontSize: 15,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

final TextStyle subtitleStyle = baseStyle.copyWith(
  color: Colors.black45,
  fontWeight: FontWeight.normal,
);

final TextStyle contentStyle = baseStyle.copyWith(
  fontWeight: FontWeight.w300,
);
