import 'dart:ui';
import 'package:vivek_portfolio/values.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  static void _launchURL(String _url) async {
    print(_url);
    await canLaunch(_url) ? await launch(_url) : 'Could not launch $_url';
  }

  static List<Widget> _createButtons(int len) {
    List<Widget> btns = [];
    var names = Values.links.keys.toList();
    for (int i = 0; i < len; i++) {
      btns.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            child: Text(
              names[i],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              backgroundColor: Colors.white,
              fixedSize: const Size(550, 50),
            ),
            onPressed: () => _launchURL(Values.links.values.toList()[i]),
          ),
        ),
      );
    }
    return btns;
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> buttons = HomePage._createButtons(
    Values.links.keys.length,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //avatar
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 80,bottom: 50),
              child:  Container(
                width: 170,
                height: 170,
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: DecorationImage(
                    image: AssetImage('assets/profile.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all( Radius.circular(170)),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              // ClipOval(
              //     child: Image.asset(
              //   'assets/profile.png',
              //   height: 170,
              //   width: 170,
              //   fit: BoxFit.cover,
              // )),
            ),
            //name
            SelectableText(
              Values.name,
              style: TextStyle(
                fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
              textAlign: TextAlign.center,
            ),
            //description
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SelectableText(
                Values.description,
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
            ),
            //buttons
            ...buttons,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: const Text(
                  'Powered by Vivek dholakiya',
                  style: TextStyle(
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: InkWell(
                child: const Text(
                  'Github Repository of this website',
                  style: TextStyle(
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
                onTap: () => HomePage._launchURL('https://github.com/vivekdholakiya'),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => _launchURL(Values.floatingActionButtonLink),
      //   tooltip: Values.floatingActionButtonName,
      //   backgroundColor: Colors.deepPurpleAccent,
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      // ),
    );
  }
}
