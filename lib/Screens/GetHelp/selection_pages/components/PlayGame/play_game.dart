import 'package:flutter/material.dart';
import 'package:mental_health_chatbot/Components/select_medical_helplines.dart';
import 'package:mental_health_chatbot/Components/select_self_care_guidelines.dart';
import 'package:mental_health_chatbot/Screens/GetHelp/selection_pages/medical_helplines.dart';
import 'package:mental_health_chatbot/Screens/GetHelp/selection_pages/self_care_guidelines.dart';
import 'package:mental_health_chatbot/constants.dart';
import 'package:mental_health_chatbot/dashboard.dart';

class PlayGameScreen extends StatelessWidget {

  final String info;
  const PlayGameScreen({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mental Health Assistant Chatbot'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Get Help",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: defaultPadding / 2),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 1,
                  child: Image.asset("assets/images/chatbot.png"),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: defaultPadding / 2),
            RichText(
              text: TextSpan(
                text: "Don't worry, I am always staying beside you. :) \nNow, let me give you some advice.",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: defaultPadding / 2),
            RichText(
              text: TextSpan(
                text: "If all three scales are under 'Normal' or 'Mild', \nyou can choose the 'Self-Practice' action to \npractice some examples of self-care.",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: defaultPadding / 2),
            RichText(
              text: TextSpan(
                text: "If any of your three scales is under 'Moderate', \n'Severe' or 'Extremely Severe', you should choose \n'Helpline' to contact the professional mental \nhealth services for immediate assistance.",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: defaultPadding / 2),
            RichText(
              text: TextSpan(
                text: "However, the result of DASS-21 is only for \nreference. You are advised to always consult \nmental health professionals if possible.",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: defaultPadding / 2),
            Divider(
              height: 50,
              thickness: 5,
            ),
            Text(
              "Select One Information",
              style: TextStyle(fontSize: 20, decoration: TextDecoration.underline, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: defaultPadding / 2),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                    child: Image.asset(
                      "assets/icons/self_care.png",
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                  SelectSelfCareGuidelines(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=>SelfCareGuidelinesScreen(info: info),
                        ),
                      );
                    },
                  ),
                ],
                ),
                Row(children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                    child: Image.asset(
                      "assets/icons/helpline.png",
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                  SelectMedicalHelplines(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=>MedicalHelplinesScreen(info: info),
                        ),
                      );
                    },
                  ),
                ],
                ),
              ],
            ),
            const SizedBox(height: defaultPadding / 2),
            SizedBox(
              width: 200,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>DashBoard(info: info),
                    ),
                  );
                },
                child: Text(" Go Back".toUpperCase()),
              ),
            ),
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
