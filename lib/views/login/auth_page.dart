import 'package:flutter/material.dart';
import 'package:voyager_1/core/config.dart';
import 'package:voyager_1/core/constants.dart';
import 'package:voyager_1/views/widgets/login_form.dart';
import 'package:voyager_1/views/widgets/sign_up_form.dart';
import 'package:voyager_1/views/widgets/social_button.dart';
import 'package:voyager_1/views/widgets/text.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isSignIn = true;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    //build login text field
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              AppText.enText['welcome_text']!,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            Text(
              isSignIn
                  ? AppText.enText['signIn_text']!
                  : AppText.enText['register_text']!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            isSignIn ? const LoginForm() : const SignUpForm(),
            Config.spaceSmall,
            isSignIn
                ? Expanded(
                    child: Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          AppText.enText['forgot-password']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            const Spacer(),
            Center(
              child: Text(
                AppText.enText['social-login']!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            Config.spaceSmall,
            const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SocialButton(social: 'google'),
                kWidth20,
                SocialButton(social: 'facebook'),
              ],
            ),
            Config.spaceSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  isSignIn
                      ? AppText.enText['signUp_text']!
                      : AppText.enText['registered_text']!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isSignIn = !isSignIn;
                    });
                  },
                  child: Text(
                    isSignIn ? 'Sign Up' : 'Sign In',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
