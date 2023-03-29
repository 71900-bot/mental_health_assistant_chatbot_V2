import 'package:flutter/material.dart';
import 'package:mental_health_chatbot/Screens/GetHelp/selection_pages/components/MoodTracker/mood_tracker.dart';
import 'package:mental_health_chatbot/Screens/GetHelp/selection_pages/components/PlayGame/play_game.dart';
import 'package:mental_health_chatbot/Screens/GetHelp/get_help.dart';
import 'package:mental_health_chatbot/constants.dart';

class SelfCareGuidelinesScreen extends StatelessWidget {

  final String info;
  const SelfCareGuidelinesScreen({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mental Health Assistant Chatbot'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Self-Care Guidelines",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: defaultPadding * 2),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              child: Image.asset(
                "assets/images/self_care_guidelines.png",
              ),
            ),
            const SizedBox(height: defaultPadding * 2),
            Row(children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text('1. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Exercise. Every day, go for a 15- to \n30-minute brisk walk.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text('2. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Consume nutritious foods and plenty of \nwater.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text('3. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Practice enough sleep every night.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text('4. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Sign off early from work or cancel social \nplans to rest.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text('5. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Spend time journaling to better understand \nyour emotions.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text('6. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Practice yoga or other mindful exercises \nthat help you reconnect with yourself.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            Row(children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text('7. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Text('Practice a hobby such as drawing, baking, \ndancing and so on.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ]),
            const SizedBox(height: defaultPadding / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(
                width: 95,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=>PlayGameScreen(info: info),
                      ),
                    );
                  },
                  child: Text("Play Game".toUpperCase(), textAlign: TextAlign.center),
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
                        builder: (context)=>MoodTrackerScreen(info: info),
                      ),
                    );
                  },
                  child: Text("Mood Tracker".toUpperCase(), textAlign: TextAlign.center),
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
                        builder: (context)=>GetHelpScreen(info: info),
                      ),
                    );
                  },
                  child: Text("Go Back".toUpperCase(), textAlign: TextAlign.center),
                ),
              ),
            ]),
          ],
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