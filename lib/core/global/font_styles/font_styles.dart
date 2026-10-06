import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart'
    show FontWeight, TextStyle, TextTheme;

abstract class FontStyles {
  static final TextStyle title = GoogleFonts.roboto(
    fontSize: 19,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle normal = GoogleFonts.roboto(
    fontWeight: FontWeight.w100,
    fontSize: 16,
  );

  static final TextStyle regular = GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  static final TextTheme textTheme = GoogleFonts.robotoTextTheme();
}
