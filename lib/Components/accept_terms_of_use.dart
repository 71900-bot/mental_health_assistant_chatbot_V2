import 'package:flutter/material.dart';
import 'package:mental_health_chatbot/constants.dart';

class AcceptTermsOfUse extends StatelessWidget {
  final Function? press;
  const AcceptTermsOfUse({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("I have read & accepted ",
          style: const TextStyle(color: kPrimaryColor, fontSize: 10),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text("ALL the terms and conditions.",
            style: const TextStyle(
              decoration: TextDecoration.underline,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        )
      ],
    );
  }
}