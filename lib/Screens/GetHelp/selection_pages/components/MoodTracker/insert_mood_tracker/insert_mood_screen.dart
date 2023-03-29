import 'package:flutter/material.dart';
import 'package:mental_health_chatbot/Screens/GetHelp/selection_pages/components/MoodTracker/insert_mood_tracker/insert_mood_tracker_form.dart';
import 'package:mental_health_chatbot/responsive.dart';

class InsertMoodScreen extends StatelessWidget {

  final String info;
  const InsertMoodScreen({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mental Health Assistant Chatbot'),),
      body: SingleChildScrollView(
        child: Responsive(
          mobile: MobileInsertMoodScreen(info: info),
          desktop: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: InsertMoodTrackerForm(info: info),
                    ),
                    // SocialSignUp()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Icon(
                Icons.email,
              ),
            ),
            Text(" $info",
                style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)
            )
          ],
        ),
      ),
    );
  }
}

class MobileInsertMoodScreen extends StatelessWidget {

  final String info;
  const MobileInsertMoodScreen({
    Key? key, required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: InsertMoodTrackerForm(info: info),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
