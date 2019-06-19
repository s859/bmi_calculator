import 'package:flutter/material.dart';

const kBottomContainerHeight = 44.0;
const kReusableCardBackgroundColorActive = Color(0xFF1D1E33);
const kReusableCardBackgroundColorInactive = Color(0xFF111328);
const kBottomContainerColour = Color(0xffeb1555);

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xff8d8e98),
);

const kNumberTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w900,
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.w500,
);

// maps from MetLife
final Map<int, List<String>> femaleWeightRange = {
  // data available from 4'9" to 5'11", subtract 1" for shoes
  58: ["102 to 111", "109 to 121", "118 to 131"],
  59: ["103 to 113", "111 to 123", "120 to 134"],
  60: ["104 to 115", "113 to 126", "122 to 137"],
  61: ["106 to 118", "115 to 129", "125 to 140"],
  62: ["108 to 121", "118 to 132", "128 to 143"],
  63: ["111 to 124", "121 to 135", "131 to 147"],
  64: ["114 to 127", "124 to 138", "134 to 151"],
  65: ["117 to 130", "127 to 141", "137 to 155"],
  66: ["120 to 133", "130 to 144", "140 to 159"],
  67: ["123 to 136", "133 to 147", "143 to 163"],
  68: ["126 to 139", "136 to 150", "146 to 167"],
  69: ["129 to 142", "139 to 153", "149 to 170"],
  70: ["132 to 145", "142 to 156", "152 to 173"],
  71: ["135 to 148", "145 to 159", "155 to 176"],
  72: ["138 to 151", "148 to 162", "158 to 179"],
};

final Map<int, List<String>> maleWeightRange = {
  // data available from 5'1" to 6'3", add 1" for shoes
  62: ["128 to 134", "131 to 141", "138 to 150"],
  63: ["130 to 136", "133 to 143", "140 to 153"],
  64: ["132 to 138", "135 to 145", "142 to 156"],
  65: ["134 to 140", "137 to 148", "144 to 160"],
  66: ["136 to 142", "139 to 151", "146 to 164"],
  67: ["138 to 145", "142 to 154", "149 to 168"],
  68: ["140 to 148", "145 to 157", "152 to 172"],
  69: ["142 to 151", "148 to 160", "155 to 176"],
  70: ["144 to 154", "151 to 163", "158 to 180"],
  71: ["146 to 157", "154 to 166", "161 to 184"],
  72: ["149 to 160", "157 to 170", "164 to 188"],
  73: ["152 to 164", "160 to 174", "168 to 192"],
  74: ["155 to 168", "164 to 178", "172 to 197"],
  75: ["158 to 172", "167 to 182", "176 to 202"],
  76: ["162 to 176", "171 to 187", "181 to 207"],
};
