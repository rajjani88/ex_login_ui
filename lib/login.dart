import 'package:ex_login_ui/utils/appcolor.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget loginBtn(String title, int index, int selected, Function() onPress) {
    return GestureDetector(
      onTap: onPress,
      child: SizedBox(
        width: 100,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  color: mWhite,
                  fontSize: index == selected ? 18 : 16,
                  fontWeight:
                      index == selected ? FontWeight.bold : FontWeight.normal),
            ),
            const SizedBox(
              height: 6,
            ),
            Visibility(
              visible: index == selected,
              child: SizedBox(
                child: Divider(
                  height: 2.5,
                  thickness: index == selected ? 2 : 1.5,
                  color: mWhite,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  int selectedIndex = 0;

  Widget input(String hint) {
    return Container(
      height: 46,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: green.withAlpha(100),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
      ),
    );
  }

  Widget greenBtn(String title, Function() onPRess) {
    return SizedBox(
      width: 100,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: green),
          onPressed: onPRess,
          child: Text(
            title,
            style: const TextStyle(color: mWhite, fontSize: 16),
          )),
    );
  }

  Widget loginBox() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bgSilver,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            input('Email'),
            const SizedBox(
              height: 14,
            ),
            input('Password'),
            const SizedBox(
              height: 14,
            ),
            greenBtn('Login', () => null)
          ],
        ),
      ),
    );
  }

  Widget registerBox() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bgSilver,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            input('Name'),
            const SizedBox(
              height: 14,
            ),
            input('Email'),
            const SizedBox(
              height: 14,
            ),
            input('Password'),
            const SizedBox(
              height: 14,
            ),
            input('Confirm Password'),
            const SizedBox(
              height: 14,
            ),
            greenBtn('SignUp', () => null)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              loginBtn('Login', 0, selectedIndex, () {
                selectedIndex = 0;
                print(selectedIndex);
                setState(() {});
              }),
              const SizedBox(
                width: 14,
              ),
              loginBtn('Sign Up', 1, selectedIndex, () {
                selectedIndex = 1;
                print(selectedIndex);
                setState(() {});
              }),
            ],
          ),
          selectedIndex == 0 ? loginBox() : registerBox(),
        ],
      ),
    );
  }
}
