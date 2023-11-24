import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professional_dark_personal_portfolio/colors.dart';
import 'package:professional_dark_personal_portfolio/constants.dart';
import 'package:professional_dark_personal_portfolio/input.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({super.key});

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController subject = TextEditingController();
  final TextEditingController message = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    message.dispose();
    email.dispose();
    phone.dispose();
    subject.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: navBarColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 60),
              Center(
                child: Text(
                  "CONTACT ME",
                  style: GoogleFonts.actor(
                    color: textColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Of course, bad code can be cleaned up. But it’s very expensive.",
                style: GoogleFonts.actor(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InputField(
                    controller: name,
                    hint: "Username",
                  ),
                  const SizedBox(width: 20),
                  InputField(
                    controller: email,
                    hint: "E-mail",
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InputField(
                    controller: phone,
                    hint: "Phone number",
                  ),
                  const SizedBox(width: 20),
                  InputField(
                    controller: subject,
                    hint: "Subject",
                  ),
                ],
              ),
              const SizedBox(height: 20),
              InputField(
                controller: message,
                hint: "Message",
                maxLines: 12,
              ),
              const SizedBox(height: 20),
              AnimatedButton(
                text: "SEND MESSAGE",
                onPress: () async {
                  if (email.text.trim().isNotEmpty && name.text.trim().isNotEmpty && phone.text.trim().isNotEmpty && subject.text.trim().isNotEmpty && message.text.trim().isNotEmpty && email.text.trim().isNotEmpty) {
                    await FirebaseFirestore.instance.collection("gunichi_hafedh").doc("3z8NW4oW8NG8qC5Yojor").update(
                      {
                        "emailers": FieldValue.arrayUnion(
                          [
                            {
                              "username": name.text.trim(),
                              "e-mail": email.text.trim(),
                              "phone_number": phone.text.trim(),
                              "subject": subject.text.trim(),
                              "message": message.text.trim(),
                              "timestamp": Timestamp.now(),
                            },
                          ],
                        ),
                      },
                    ).then(
                      (void value) {
                        showToast("E-mail successfully sent");
                        name.text = "";
                        email.text = "";
                        phone.text = "";
                        subject.text = "";
                        message.text = "";
                      },
                    );
                  } else {
                    showToast("Empty fields", color: "rgb(255,0,0);");
                  }
                },
                animatedOn: AnimatedOn.onHover,
                backgroundColor: backgroundColor,
                transitionType: TransitionType.RIGHT_TO_LEFT,
                isReverse: true,
                textStyle: GoogleFonts.abel(color: textColor, fontSize: 16, fontWeight: FontWeight.bold),
                animationDuration: 1.seconds,
                selectedBackgroundColor: textColor,
                selectedTextColor: backgroundColor,
                width: 200,
                height: 40,
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 2,
                    color: blue,
                    height: 250,
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 2,
                    color: blue,
                    height: 175,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Get In Touch.",
                        style: GoogleFonts.actor(
                          color: blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Personal information.",
                        style: GoogleFonts.actor(
                          color: textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.locationPin,
                            color: textColor,
                            size: 15,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Address",
                            style: GoogleFonts.actor(
                              color: textColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Stah Jabeur, Monastir, Tunisia",
                        style: GoogleFonts.actor(
                          color: textColor,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.envelope,
                            color: textColor,
                            size: 15,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "E-mail",
                            style: GoogleFonts.actor(
                              color: textColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "hafedhgunichi@gmail.com",
                        style: GoogleFonts.actor(
                          color: textColor,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.phone,
                            color: textColor,
                            size: 15,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Phone number",
                            style: GoogleFonts.actor(
                              color: textColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "+216 28 056 362",
                        style: GoogleFonts.actor(
                          color: textColor,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
