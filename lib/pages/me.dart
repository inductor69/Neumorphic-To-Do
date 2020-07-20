import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../style.dart';

class Mine extends StatefulWidget {
  @override
  _AudioPlayerSampleState createState() => _AudioPlayerSampleState();
}

// ignore: missing_return
Future<bool> _launchURL() async {
  const url = 'https://www.linkedin.com/in/aditya-kumar-b99b1519b/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<bool> _launchURL1() async {
  const url = 'https://www.facebook.com/profile.php?id=100004027149043';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<bool> _launchURL2() async {
  const url = 'https://www.quora.com/profile/Aditya-Kumar-248';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _AudioPlayerSampleState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
        themeMode: ThemeMode.dark,
        darkTheme: NeumorphicThemeData(
          defaultTextColor: Style.textColorDark,
          baseColor: Style.bgColorDark,
          accentColor: Style.primaryColor,
          variantColor: Style.primaryColor,
          intensity: 0.6,
          lightSource: LightSource.topRight,
          shadowDarkColor: Colors.black,
          shadowLightColor: Colors.grey[500],
          depth: 3,
        ),
        child: _Page());
  }
}

class _Page extends StatefulWidget {
  @override
  __PageState createState() => __PageState();
}

class __PageState extends State<_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NeumorphicBackground(
          child: Column(
            children: <Widget>[
              SizedBox(height: 14),
              _buildTopBar(context),
              SizedBox(height: 80),
              _buildImage(context),
              SizedBox(height: 30),
              _buildTitle(context),
              SizedBox(height: 30),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: NeumorphicButton(
              padding: const EdgeInsets.all(18.0),
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.circle(),
              ),
              child: Icon(
                Icons.navigate_next,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "About Me",
              style: TextStyle(
                  color: NeumorphicTheme.defaultTextColor(context),
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
      ),
      child: Container(
          height: 150,
          width: 150,
          child: Image.asset(
            "assets/Aditya.jpg",
            fit: BoxFit.cover,
          )),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("Aditya Kumar",
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 32,
                color: NeumorphicTheme.defaultTextColor(context))),
        const SizedBox(
          height: 4,
        ),
        Text("IIT-Delhi",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: NeumorphicTheme.defaultTextColor(context))),
        SizedBox(height: 12),
        const SizedBox(
          height: 4,
        ),
        Text("Web Dev | App Dev",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: NeumorphicTheme.defaultTextColor(context))),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NeumorphicButton(
              padding: const EdgeInsets.all(18.0),
              onPressed: _launchURL,
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.circle(),
              ),
              child: Icon(
                FontAwesomeIcons.linkedin,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 25),
            NeumorphicButton(
              padding: const EdgeInsets.all(18.0),
              onPressed: _launchURL1,
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.circle(),
              ),
              child: Icon(
                FontAwesomeIcons.facebook,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 25),
            NeumorphicButton(
              padding: const EdgeInsets.all(18.0),
              onPressed: _launchURL2,
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.circle(),
              ),
              child: Icon(FontAwesomeIcons.quora, color: Colors.white),
            ),
            // SizedBox(width: 25),
            // NMButton(icon: FontAwesomeIcons.linkedin),
            // SizedBox(width: 25),
            //NMButton(icon: FontAwesomeIcons.medium),
          ],
        ),
      ],
    );
  }

  Color _iconsColor() {
    final theme = NeumorphicTheme.of(context);
    if (theme.isUsingDark) {
      return theme.current.accentColor;
    } else {
      return null;
    }
  }
}
