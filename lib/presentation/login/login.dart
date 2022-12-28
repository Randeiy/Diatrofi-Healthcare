import 'package:diatfori/common/constant.dart';
import 'package:diatfori/data/authentic/service.dart';
import 'package:diatfori/presentation/login/deviderOr.dart';
import 'package:diatfori/presentation/login/register.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../screen/mainpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kSoftGrey,
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.06),
              Text(
                'MASUK',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: kMatteBlack,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Lottie.asset("assets/lottie/login.json"),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: kSoftGreen,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TextField(
                  controller: emailController,
                  cursorColor: kSoftGreen,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: kMatteBlack,
                    ),
                    hintText: "Email",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: kSoftGreen,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  cursorColor: kSoftGreen,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: kMatteBlack,
                    ),
                    hintText: "Kata Sandi",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                height: size.height * 0.07,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: ElevatedButton(
                    onPressed: () async {
                      final result = await AuthServices.signIn(
                          emailController.text, passwordController.text);
                      if (result != null &&
                          emailController.text != 'diatrofi.admin@email.com') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        );
                      } else if (emailController.text == "" ||
                          passwordController.text == "") {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content:
                              Text('Email / Kata Sandi tidak boleh kosong.'),
                          duration: Duration(milliseconds: 600),
                        ));
                      } else if (emailController.text ==
                          'diatrofi.admin@email.com') {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content:
                              Text('Email anda tidak terdaftar sebagai user.'),
                          duration: Duration(milliseconds: 600),
                        ));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                              'Email / Kata Sandi salah. Silakan coba lagi.'),
                          duration: Duration(milliseconds: 600),
                        ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kLineGreen,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                    ),
                    child: Text(
                      'Masuk',
                      style: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.001),
              SizedBox(height: size.height * 0.001),
              DeviderOr(size: size),
              SizedBox(
                width: size.width * 0.7,
                height: size.height * 0.06,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: OutlinedButton(
                    onPressed: () async {
                      final result = await AuthServices.signUpWithGoogle();
                      if (result != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 5),
                        Text('Lanjut dengan Akun Google',
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(color: Colors.black, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Belum punya Akun ? ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const RegisterPage();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Daftar",
                      style: Theme.of(context).textTheme.button?.copyWith(
                          color: kMatteBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
