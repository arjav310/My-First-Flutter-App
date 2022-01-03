import 'package:flutter/material.dart';
import 'package:toggle/home_page.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    Color? colors;

    switch (args.title) {
      case "Red":
        colors = Colors.red;
        break;
      case "Green":
        colors = Colors.green;
        break;
      case "Yellow":
        colors = Colors.yellow;
        break;
      case "Black":
        colors = Colors.grey.shade800;
        break;
      case "Blue":
        colors = Colors.blue.shade800;
        break;
      default:
    }

    return Scaffold(
      backgroundColor: args.isDarkModeEnable ? Colors.black : colors,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("New Page" + " " + args.title),
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: args.isDarkModeEnable ? colors : Colors.purple,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_left),
                  Text("Go back"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
