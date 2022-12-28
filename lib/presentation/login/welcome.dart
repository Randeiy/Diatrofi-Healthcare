import 'package:diatfori/common/constant.dart';
import 'package:diatfori/presentation/login/login.dart';
import 'package:diatfori/presentation/login/register.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: kSoftGrey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.09),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Selamat Datang di ',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 2),
                Text(
                  'Diatrofi',
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: kMatteBlack,
                        backgroundColor: kLineGreen,
                      ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            Lottie.network(
                "https://assets1.lottiefiles.com/packages/lf20_snmohqxj/lottie_step2/data.json"),
            SizedBox(height: size.height * 0.05),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              height: size.height * 0.07,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginPage();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kLineGreen,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                  ),
                  child: Text(
                    'Masuk',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ),
            ),

            // REGISTER
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              height: size.height * 0.07,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const RegisterPage();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kMatteBlack,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                  ),
                  child: Text('Daftar',
                      style: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
