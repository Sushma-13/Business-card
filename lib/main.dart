import 'package:business_card/person.dart';
import 'package:business_card/style_constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Business Card',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Person person = Person('Sushma Goswami', 'Developer', '1234567890',
      'xyz@pqr.com', 'assets/icons/pikachu.png');

  Widget informationCard(IconData icon, String information) {
    return Card(
      elevation: 5,
      color: StyleConstants.primaryColor,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: ListTile(
        dense: true,
        leading: Icon(
          icon,
          color: StyleConstants.bgColor,
        ),
        title: Text(
          information,
          style: TextStyle(
              fontFamily: StyleConstants.primaryAccentFontFamily,
              fontSize: 18,
              color: StyleConstants.detailTextColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: StyleConstants.bgColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: StyleConstants.primaryColor,
              radius: MediaQuery.of(context).size.height / 7,
              backgroundImage: AssetImage(person.image),
            ),
            Text(
              person.name,
              style: TextStyle(
                  fontSize: StyleConstants.nameSize,
                  color: StyleConstants.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: StyleConstants.primaryFontFamily),
            ),
            Text(
              person.title,
              style: TextStyle(
                  fontSize: StyleConstants.titleSize,
                  color: StyleConstants.primaryAccentColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                  fontFamily: StyleConstants.primaryAccentFontFamily),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Divider(
                color: StyleConstants.primaryAccentColor,
              ),
            ),
            informationCard(Icons.phone, person.phoneNumber),
            informationCard(Icons.mail, person.email),
          ],
        ),
      ),
    );
  }
}
