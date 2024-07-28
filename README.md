https://github.com/marketplace/actions/flutter-action




  - run: flutter pub get
  - run: flutter test
  - run: flutter build web




jobs:
  main:
    runs-on: macos-latest
    steps:
      - name: Clone repository
        uses: actions/checkout@v4
      - name: Set up Flutter
        uses: subosito/flutter-action@v2
        with:
          channel: stable
      - run: flutter pub get
      - run: flutter test
      - run: flutter build ios --release --no-codesign


https://pub.dev/packages/form/example

https://medium.com/@mandeep_61901/how-to-use-svg-as-a-icon-in-a-project-of-with-bottom-navigation-bar-2424b7404aa7

https://jonas-rodehorst.dev/tools/flutter-color-from-hex

https://api.flutter.dev/flutter/painting/BoxFit.html


https://api.flutter.dev/flutter/painting/EdgeInsets-class.html


https://api.flutter.dev/flutter/material/TextFormField-class.html


https://stackoverflow.com/questions/66476548/flutter-textbutton-padding

https://stackoverflow.com/questions/52243364/how-to-add-a-gradient-to-a-button-in-flutter

https://stackoverflow.com/questions/73562201/change-background-color-on-textfield-when-focused

https://stackoverflow.com/questions/50400529/how-to-change-textfields-height-and-width

https://medium.com/@nikhithsunil/theme-your-flutter-app-a-guide-to-themedata-and-colorscheme-d8bca920a6b5


https://stackoverflow.com/questions/49543988/flutter-smooth-transition-color-for-lineargradient

https://stackoverflow.com/questions/49543988/flutter-smooth-transition-color-for-lineargradient

https://github.com/marketplace/actions/flutter-action

https://github.com/marketplace/actions/deploy-to-github-pages

InputDecoration
isDense: true and contentPadding: EdgeInsets.all(8)

```dart
const Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: const Icon(Icons.lock),
      ))


prefixIcon: Icon(Icons.lock_rounded, size: 24),


class TextButtonPadding extends StatelessWidget {
  EdgeInsets _getPadding(Set<MaterialState> states) {
    const interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
    };
    if (states.any(interactiveStates.contains)) {
      return EdgeInsets.all(30.0);
    }
    return EdgeInsets.zero;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith(_getPadding),
          ),
          onPressed: () {},
          child: Text(
            'Text Button',
          ),
        ),
      ),
    );
  }
}




class TextButtonPadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.all(30.0),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Text Button',
          ),
        ),
      ),
    );
  }
}



    import 'package:flutter/cupertino.dart';
    import 'package:flutter/material.dart';
    import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
    import 'package:pan_asia_bank_app/widgets/NavDrawer.dart';
    
    class ChangePassword extends StatelessWidget {
      Widget _inputField(String title, Color border) {
        return TextField(
          decoration: InputDecoration(
            hintText: title,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: border),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: border),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: border),
            ),
          ),
        );
      }
    
      Widget _buttons(name, BuildContext context) {
        return Center(
            child: ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ButtonTheme(
                minWidth: 200,
                child: RaisedButton(
                  child: new Text(name),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(color: Colors.red)),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {},
                )),
          ],
        ));
      }
    
      @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return Scaffold(
            drawer: NavDrawer(),
            appBar: AppBar(
              title: Image.asset("assets/logo.png", fit: BoxFit.cover),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 20, bottom: 20),
                  child:
                      HtmlWidget("""<h2 style='color:red;'>Change Password</h2>"""),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: _inputField('Current Password', Colors.grey),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: _inputField('New Password', Colors.grey),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child:
                                    _inputField('Re - New Password', Colors.grey),
                              ),
                              Container(
                                  child: _buttons('Change Password', context)),
                            ],
                          ))
                        ],
                      ),
                    )),
                SizedBox(
                  height: 10,
                )
              ],
            ));
      }
    }
```

```dart
//https://stackoverflow.com/questions/51033222/how-to-rebuild-widget-in-flutter-when-a-change-occurs
  var _isLoading = true;

  void initState() {
    super.initState();
    _fetchData();
    const fiveSec = const Duration(seconds: 5);
    new Timer.periodic(fiveSec, (Timer t) {
      _fetchData();
    });
  }



  var arrivalsList = new List<ArrivalEstimates>();

  _fetchData() async {
    var arrivalsList = new List<ArrivalEstimates>(); // *********** #1
    stopsList.clear();
    final url = "API_URL";
    print("Fetching: " + url);
    final response = await http.get(url);
    final busesJson = json.decode(response.body);
    if (busesJson["service_id"] == null) {
      print("no service id");
      globals.serviceActive = false;
    } else {
      busesJson["ResultSet"]["Result"].forEach((busJson) {
        if (busJson["arrival_estimates"] != null) {
          busJson["arrival_estimates"].forEach((arrivalJson) {
            globals.serviceActive = true;
            final arrivalEstimate = new ArrivalEstimates(
                arrivalJson["route_id"], arrivalJson["arrival_at"], arrivalJson["stop_id"]
            );
            arrivalsList.add(arrivalEstimate);
          });
        }
      });
    }
    setState(() {
      _isLoading = false;
      this.arrivalsList = arrivalsList; // *********** #1
    });
  }
```