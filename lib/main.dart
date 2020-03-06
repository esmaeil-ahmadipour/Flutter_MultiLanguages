import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multilanguages/utils/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('fa', 'IR'),
      ],
      //This delegates make sure that the localization data for the proper language is loader.
      localizationsDelegates: [
        //A class which loads the translations from JSON files.
        AppLocalizations.delegate,
        //Built-in localization of basic text for Material Widget.
        GlobalMaterialLocalizations.delegate,
        //Built-in localization for text direction LTR/RTL.
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String textDirections;
    switch(Localizations.localeOf(context).languageCode)
    {
      case("fa"):
        textDirections="RTL";
        break;
      case("ar"):
        textDirections="RTL";
        break;
      case("he"):
        textDirections="RTL";
        break;
      case("ps"):
        textDirections="RTL";
        break;
        case("ur"):
        textDirections="RTL";
        break;
        default: {
          textDirections="LTR";
        }
    }
    String language = Localizations.localeOf(context).languageCode;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                alignment: textDirections == "RTL"
                           ?Alignment.centerRight:Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context).translate('firstName_string'),
                  style: TextStyle(
                      fontSize: 25,
                      backgroundColor:
                      textDirections == "RTL"
                              ? Colors.blue
                              : Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: textDirections == "RTL"
                           ?Alignment.centerRight:Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context).translate('lastName_string'),
                  style: TextStyle(
                      fontSize: 25,
                      backgroundColor:
                      textDirections == "RTL"
                              ? Colors.blue
                              : Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Switch Language Of Device Between English & Farsi And See Result.\n\n DEVICE_LANGUAGE : $language :: $textDirections",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
