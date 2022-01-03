import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> items = [
    {
      "title": "Red",
      "route": "/newPage",
    },
    {
      "title": "Green",
      "route": "/newPage",
    },
    {
      "title": "Yellow",
      "route": "/newPage",
    },
    {
      "title": "Black",
      "route": "/newPage",
    },
    {
      "title": "Blue",
      "route": "/newPage",
    }
  ];

  final titleController = TextEditingController();
  bool isSwitchChecked = false;

  // void submitData() {
  //   final enteredTitle = titleController.text;

  //   if (enteredTitle.isEmpty) {
  //     return;
  //   }

  //   setState(() {
  //     items.add({
  //       "title": enteredTitle,
  //       "route": "/newPage",
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20),
        color: isSwitchChecked ? Colors.black : Colors.white,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            AppBar(
              title: Text("My First App"),
            ),
            Center(
              child: Switch(
                value: isSwitchChecked,
                onChanged: (bool) {
                  setState(() {
                    isSwitchChecked = bool;
                  });
                },
              ),
            ),
            Text(
              isSwitchChecked ? "Dark mode" : "Light mode",
              style: TextStyle(
                  color: !isSwitchChecked ? Colors.black : Colors.white),
            ),
            SizedBox(
              height: 15,
            ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: Container(
            //         padding: EdgeInsets.all(10),
            //         child: TextField(
            //           controller: titleController,
            //           decoration: InputDecoration(
            //             contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            //             labelText: 'Title',
            //             labelStyle: TextStyle(
            //                 color:
            //                     !isSwitchChecked ? Colors.black : Colors.white),
            //             enabledBorder: OutlineInputBorder(
            //               borderSide: BorderSide(
            //                   color: !isSwitchChecked
            //                       ? Colors.black
            //                       : Colors.white),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     Container(
            //       margin: EdgeInsets.all(10),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         color: Colors.purple,
            //       ),
            //       child: IconButton(
            //         onPressed: submitData,
            //         icon: Icon(Icons.add),
            //         color: Colors.white,
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      Icons.ac_unit,
                      size: 40,
                      color:
                          !isSwitchChecked ? Colors.grey[600] : Colors.grey[50],
                    ),
                    title: Text(
                      items[index]['title'].toString(),
                      style: TextStyle(
                          color:
                              !isSwitchChecked ? Colors.black : Colors.white),
                    ),
                    subtitle: Text(
                      "Color",
                      style: TextStyle(
                          color:
                              !isSwitchChecked ? Colors.black : Colors.white),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        items[index]['route'].toString(),
                        arguments: ScreenArguments(
                            items[index]['title'].toString(), isSwitchChecked),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  bool isDarkModeEnable;

  ScreenArguments(this.title, this.isDarkModeEnable);
}
