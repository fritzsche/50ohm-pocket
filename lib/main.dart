import 'package:fuenfzigohm/coustom_libs/database.dart';
import 'package:fuenfzigohm/screens/chapterSelection.dart';
import 'package:fuenfzigohm/helpers/imprint.dart';
import 'package:fuenfzigohm/screens/intro.dart';
import 'package:fuenfzigohm/screens/packagesListing.dart';
import 'package:fuenfzigohm/helpers/privacy.dart';
import 'package:fuenfzigohm/screens/questionsLicenseNotice.dart';
import 'package:fuenfzigohm/style/style.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    FutureBuilder(
        future: Database().load(),
        builder: (context, snapshot){
          if(snapshot.hasData)
            return DatabaseWidget(
              prog_database: (snapshot.data as List )[0],
              settings_database: (snapshot.data as List )[1],
              child: MaterialApp(
                theme: lightmode(),
                darkTheme: darkmode(),
                themeMode: ThemeMode.system,
                title: '50ohm-pocket',
                home: Welcome(),
                routes:{
                  '/learn': (context) => Learningmodule(),
                  '/welcome': (context) => Welcome(),
                  '/appPackages': (context) => OssLicensesPage(),
                  '/questionsLicenseNotice': (context) => QuestionsLicensePage(),
                  '/privacyPolicy' : (context) => PrivacyPage(),
                  '/imprint' : (context) => ImprintPage(),
                },
                debugShowCheckedModeBanner: false,
              ),
            );
          if(snapshot.hasError) return Text("Error");
          return Center(child: CircularProgressIndicator());
        }
    )
  );
}

