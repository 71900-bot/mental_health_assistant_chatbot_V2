import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mental_health_chatbot/Screens/GetHelp/selection_pages/components/MoodTracker/mood_tracker.dart';
import 'package:mental_health_chatbot/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class InsertMoodTrackerForm extends StatefulWidget {
  final String info;
  const InsertMoodTrackerForm({Key? key, required this.info}) : super(key: key);
  @override
  _InsertMoodTrackerState createState() => _InsertMoodTrackerState();
}

class _InsertMoodTrackerState extends State<InsertMoodTrackerForm>{

  late String mood;
  TextEditingController textarea = TextEditingController();
  int currentPageIndex = 0;
  String timeString = "xxxx-xx-xx \n xx:xx:xx";

  void _getTime() {
    final String formattedDateTime =
    DateFormat('yyyy-MM-dd \n kk:mm:ss').format(DateTime.now()).toString();
    setState(() {
      timeString = formattedDateTime;
      print(timeString);
    });
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          SizedBox(height: defaultPadding / 2),
          Text(
            "New Entry",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: defaultPadding * 2),
          Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  new BoxShadow(color: Colors.orange, offset: new Offset(6.0, 6.0),),
                ],
              ),
              child: Text(
              timeString.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          Text(
            "How Was Your Day?",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: defaultPadding / 2),
         <Widget>[
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: Image.asset(
                "assets/icons/worst_emoji.png",
                height: 70.0,
                width: 70.0,
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: Image.asset(
                "assets/icons/bad_emoji.png",
                height: 70.0,
                width: 70.0,
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: Image.asset(
                "assets/icons/okay_emoji.png",
                height: 70.0,
                width: 70.0,
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: Image.asset(
                "assets/icons/good_emoji.png",
                height: 70.0,
                width: 70.0,
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: Image.asset(
                "assets/icons/best_emoji.png",
                height: 70.0,
                width: 70.0,
              ),
            ),
          ][currentPageIndex],
        NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
            if (currentPageIndex == 0){
              mood = "Worst";
            }
            else if (currentPageIndex == 1){
              mood = "Bad";
            }
            else if (currentPageIndex == 2){
              mood = "Okay";
            }
            else if (currentPageIndex == 3){
              mood = "Good";
            }
            else{
              mood = "Best";
            }
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.sentiment_very_dissatisfied),
            label: 'Worst',
          ),
          NavigationDestination(
            icon: Icon(Icons.sentiment_dissatisfied),
            label: 'Bad',
          ),
          NavigationDestination(
            icon: Icon(Icons.sentiment_neutral),
            label: 'Okay',
          ),
          NavigationDestination(
            icon: Icon(Icons.sentiment_satisfied),
            label: 'Good',
          ),
          NavigationDestination(
            icon: Icon(Icons.sentiment_very_satisfied),
            label: 'Best',
          ),
        ],
    ),
          const SizedBox(height: defaultPadding / 2),
        Row(
          children: <Widget>[
            Expanded(
              child: TextFormField(
              controller: textarea,
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              decoration: InputDecoration(
              hintText: "Write Comments Here...",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.redAccent)
            ),
        ),
        validator: (textarea){
          if(textarea ==  null || textarea.isEmpty)
          {
            return '* Please Write Your Comments.';
          }
          return null;
        },
      ),
        ),
          ],
        ),
          const SizedBox(height: defaultPadding / 2),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 95,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if(_formkey.currentState!.validate())
                      {
                        NewMoodLog();
                        print("Successful");
                      }else{
                        print("Unsuccessful");
                      }
                    },
                    child: Text("Add".toUpperCase()),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 95,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=>MoodTrackerScreen(info: widget.info),
                        ),
                      );
                    },
                    child: Text("Cancel".toUpperCase(), textAlign: TextAlign.center),
                  ),
                ),
              ]),
        ],
      ),
    );
  }

  Future NewMoodLog() async{

    var url = "http://192.168.43.74/mental_health_assistant_chatbot/MoodTracker/moodTracker.php";
    var response = await http.post(url, body: {
      "email": widget.info,
      "date": timeString,
      "mood": mood,
      "comment": textarea.text
    });
    var data = json.decode(json.encode(response.body));
    print(data);

    if (data == "Connection Success!Success") {
      Fluttertoast.showToast(
          msg: "Successfully Add New Entry!",
          fontSize: 25,
          textColor: Colors.green
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MoodTrackerScreen(info: widget.info),),);
    }
  }
}

