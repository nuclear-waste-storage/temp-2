import 'package:flutter/material.dart';
import 'widgets/signin.dart';

void main() {
  runApp(MaterialApp(
      title: 'Clario Test Assignment',
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: Color(0xFFB93C5D),
          onPrimary: Colors.black,
          secondary: Color(0xFFEFF3F3),
          onSecondary: Color(0xFF322942),
          error: Colors.redAccent,
          onError: Colors.white,
          background: Color(0xFFE6EBEB),
          onBackground: Colors.white,
          surface: Color(0xFFFAFBFB),
          onSurface: Color(0xFF241E30),
          brightness: Brightness.light,
        ),
        canvasColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          // fillColor: Colors.grey.withOpacity(0.1),
          // filled: true,
            // hintStyle: TextStyle(color: Color(0xFF4A4E71)),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6F91BC)),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFF8080)),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFF8080)),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            focusColor: Color(0xFFFFFFFF),
          // border: const OutlineInputBorder(
          //   borderSide: BorderSide.none,
          //   borderRadius: BorderRadius.all(Radius.circular(4.0)),
          // ),
          // enabledBorder: const OutlineInputBorder(
          //   borderSide: BorderSide.none,
          //   borderRadius: BorderRadius.all(Radius.circular(4.0)),
          // ),
          // focusedBorder: const OutlineInputBorder(
          //   borderSide: BorderSide.none,
          //   borderRadius: BorderRadius.all(Radius.circular(4.0)),
          // ),
          // errorBorder: const OutlineInputBorder(
          //   borderSide: BorderSide.none,
          //   borderRadius: BorderRadius.all(Radius.circular(4.0)),
          // ),
          // focusedErrorBorder: const OutlineInputBorder(
          //   borderSide: BorderSide.none,
          //   borderRadius: BorderRadius.all(Radius.circular(4.0)),
          // ),
          // disabledBorder: const OutlineInputBorder(
          //   borderSide: BorderSide.none,
          //   borderRadius: BorderRadius.all(Radius.circular(4.0)),
          // ),
        ),
      ),
      // ThemeData(
      //   // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: const SignInPage(title: 'Home Page1111111111111'),
  ));
}
