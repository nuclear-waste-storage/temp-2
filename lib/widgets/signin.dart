import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, required this.title});
  final String title;
  @override
  State<SignInPage> createState() => _SignInPageState();
}

// Future<void> _showMyDialog() async {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('AlertDialog Title'),
//         content: const SingleChildScrollView(
//           child: ListBody(
//             children: <Widget>[
//               Text('This is a demo alert dialog.'),
//               Text('Would you like to approve of this message?'),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('Approve'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

class _SignInPageState extends State<SignInPage> {
  String? _email = '';
  String? _password = '';
  bool _obscureText = true;

  // String? _passwordError = '';
  // isEmailFocused
  // isEmailValid

  final _formKey = GlobalKey<FormState>();
  // final _focusNode = FocusNode();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _focusNode.addListener(() {
  //     if (!_focusNode.hasFocus) {
  //       _formKey.currentState!.validate();
  //     }
  //     // print("Has focus: ${_focusNode.hasFocus}");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
           gradient: LinearGradient(
            colors: [
              Color(0xfff4f9ff),
              Color(0xffe0edfb),
            ],
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            tileMode: TileMode.repeated,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.scaleDown, // fill
              ),
            ),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Container(
                padding: EdgeInsets.only(top: 138, left: 30, right: 30, bottom: 283),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...[
                      Text(
                        'Sign in',
                        // style: TextStyle(
                        //   fontSize: 28.0,
                        //   fontWeight: FontWeight.bold,
                        // ),
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(color: Color(0xFF4A4E71)),
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 40),
                      Column(
                        children: [
                        ...[
                            SizedBox(
                              width: 315,
                              // height: 48,
                              child: Focus(
                                onFocusChange: (hasFocus) {
                                  // if (!hasFocus) {
                                  //    _formKey.currentState!.validate('');
                                  // }
                                },
  child: TextFormField(
                                // focusNode: _focusNode,
                                // autofocus: true,
                                // style: TextStyle(fontSize: 16, color: Color(0xFF151D51)),
                                keyboardType: TextInputType.emailAddress,
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(color: Color(0xFF151D51)),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                                // autofocus: true,
                                decoration: InputDecoration(
                                  hintText: "Enter your email address",
                                  hintStyle: GoogleFonts.inter(
                                    textStyle: TextStyle(color: Color(0xFF6f91bc)),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.only(
                                    left: 14.0,
                                    bottom: 8.0,
                                    top: 8.0
                                  ),
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    _email = value;
                                  });
                                },
                                validator: (String? value) {
                                  if (value == '') {
                                    return 'Email should not be empty';
                                  }
                                  if (value != null && !EmailValidator.validate(value)) {
                                    return 'Email is invalid';
                                  }
                                  return null;
                                },
                              ),),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              width: 315,
                              child: TextFormField(
                                // style: TextStyle(fontSize: 16, color: Color(0xFF151D51)),
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(color: Color(0xFF151D51)),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Enter your password",
                                  hintStyle: GoogleFonts.inter(
                                    textStyle: TextStyle(color: Color(0xFF6f91bc)),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.only(
                                    left: 14.0,
                                    bottom: 8.0,
                                    top: 8.0
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      _toggle();
                                    },
                                    child:
                                      Transform.flip(
                                        flipX: true,
                                    // Transform.scale(
                                      // scaleX: -1,
                                    // Transform(
                                      // alignment: Alignment.center,
                                      // transform: Matrix4.rotationY(math.pi),
                                      
                                      child: Icon(
                                        _obscureText ? Icons.visibility_off : Icons.visibility,
                                        size: 24.0,
                                        color: Color(0xFF6F91BC),
                                      ),

                                      // child: IconButton(
                                      //   padding: const EdgeInsets.only(
                                      //     right: 20,
                                      //   ),
                                      //   icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, size: 24),
                                      //   onPressed: () {
                                      //     // ...
                                      //   },
                                      // ),
                                    ),
                                  ),
                                ),
                                validator: (String? value) {
                                  if (value == null || value == '') {
                                    return 'Password is empty.';
                                  }
                                  if (value.length < 8) {
                                    return 'Password too short.';
                                  }
                                  if (value.length > 64) {
                                    return 'Password too big.';
                                  }
                                  if (!RegExp(r'\d+').hasMatch(value)) {
                                    return 'No digits.';
                                  }
                                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                    return 'No uc characters.';
                                  }
                                  return null;
                                },
                                // onSaved: (String? value) => _password = value,
                                onChanged: (String? value) => setState(() {
                                  _password = value;
                                }),
                                obscureText: _obscureText,
                              ),
                            ),
                            // Text(
                            //   '$_passwordError',
                            //   style: TextStyle(color: Colors.green),
                            //   textAlign: TextAlign.left,
                            // ),
                            SizedBox(height: 20),
                            // TextButton(
                            //     onPressed: _toggle,
                            //     child: new Text(_obscureText ? "Show" : "Hide")
                            // ),
                            // Container(
                            //   child: Column(
                            //     children: [
                            //       Text(
                            //         '8 characters or more (no spaces)',
                            //         style: TextStyle(
                            //           color: Colors.red,
                            //         ),
                            //       ),
                            //       Text(
                            //         'Uppercase and lowercase letters',
                            //       ),
                            //       Text(
                            //         'At least one digit',
                            //       )
                            //     ],
                            //   )
                            // ),
                          ],
                        ],
                      ),
                      SizedBox(height: 40),
                      TextButton(
                        // child: const Text('Sign in'),
                        style: TextButton.styleFrom(
                          fixedSize: const Size(240, 48),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.all(0.0),
                          // padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
                          // textStyle: TextStyle(
                          //   fontSize: 16.0,
                          //   fontWeight: FontWeight.bold,
                          // ),
                        ),
                        // padding: const EdgeInsets.all(0.0),
                        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                            colors: [
                              Color(0xff70c3ff),
                              Color(0xff4b65ff),
                            ],
                            stops: [0.0, 1.0],
                            begin: FractionalOffset.centerLeft,
                            end: FractionalOffset.centerRight,
                            tileMode: TileMode.repeated,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(80.0)),
                          ),
                          child: Container(
                            constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Sign in',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(color: Color(0xFFFFFFFF)),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // Sign up success
  // if (isValid) {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //     backgroundColor: Colors.green,
                      //     content: Text(
                      //       'Form is valid',
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //   ),
                      // );
                    // }


                    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
                          }
                        }
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
