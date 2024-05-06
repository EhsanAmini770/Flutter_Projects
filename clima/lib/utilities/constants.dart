import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const apiKey = 'e105f2213f4478c64e29ad887fb7da01';
const openWeatherMapUrl ='https://api.openweathermap.org/data/2.5/weather';

const kMidnightColor = Colors.white60;
const kOverlayColor = Colors.white10;
const kDarkColor = Colors.white24;
const kLightColor =Colors.white;
const kTextFilledTextStyle = TextStyle(
  fontSize: 16,
  color: kMidnightColor,
);
const kFilledDecoration = InputDecoration(
  fillColor: kOverlayColor,
  filled: true, 
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide.none,
  ),
  hintText: 'Enter City Name',
  prefixIcon: Icon(Icons.search),
  hintStyle: kTextFilledTextStyle,
);

var kLocationTextStyle = GoogleFonts.monda(
  fontSize: 16,
  color: kMidnightColor
);

var kTempTextStyle = GoogleFonts.daysOne(
  fontSize: 80,
);

var kDetailTextStyle = GoogleFonts.monda(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: kMidnightColor
);

var kDetailTitleTextStyle = GoogleFonts.monda(
color: kDarkColor,
  fontSize: 16
);

var kDetailSuffixStyle =  GoogleFonts.monda(
  fontSize: 12,
  color: kMidnightColor,
);