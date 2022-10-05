import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(6), //отступы
      decoration: const BoxDecoration(color: Color(0xFF039EA2)), //цвет фона
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Spacer(flex: 4), //интервалы между объектами
        const Text("medinow",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 32,
                fontWeight: FontWeight.w900,
                letterSpacing: 2)), //межбуквенный интервал
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text("Meditate With Us",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 18,
              )),
        ),
        const Spacer(flex: 1),
        const Button_Widget("Sign in with Apple"),
        const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Button_Widget("Continue with Email or Phone",
              color: Color(0xFFCDFDFE)),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            "Continue with Google",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        const Spacer(flex: 2),
        Expanded(
          flex: 4,
          child: Padding(
              padding: const EdgeInsets.only(bottom: 26),
              child: Image.asset("assets/images/welcome_screen_Img.png",
                  fit: BoxFit.contain)),
        ),
      ]),
    ));
  }
}

class Button_Widget extends StatelessWidget {
  const Button_Widget(this.text, {Key? key, this.color = Colors.white})
      : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(24.0), //округление углов кнопок
            ),
          ),
        ),
        child: Text(text,
            style: const TextStyle(fontSize: 16, color: Colors.black)),
      ),
    );
  }
}
