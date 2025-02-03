import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/images/logo.png",
                    width: 100, height: 100, fit: BoxFit.fill),
                Text('MediCare'),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: const SizedBox(
                width: 250,
                child: Text(
                  'Please put your information below to sign in to your account',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 36),
                  child: const SizedBox(
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Email'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: SizedBox(
                    child: TextField(
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              icon: Icon(passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off))),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(180, 0, 0, 0),
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            )),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 55),
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/icons/image 2.png",
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
