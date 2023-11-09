import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyager_1/core/color.dart';
import 'package:voyager_1/core/config.dart';
import 'package:voyager_1/services/auth.dart';
import 'package:voyager_1/views/widgets/button.dart';
import 'package:voyager_1/views/widgets/navbar/main_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  // final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();
  bool obsecurePass = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            validator: (value) =>
                value!.isEmpty ? 'Email cannot be empty!' : null,
            decoration: const InputDecoration(
              hintText: 'Email Address',
              labelText: 'Email',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Config.primaryColor,
            ),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _confirmPassController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.primaryColor,
            obscureText: obsecurePass,
            validator: (value) =>
                value!.isEmpty ? 'password cannot be empty!' : null,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                alignLabelWithHint: true,
                prefixIcon: const Icon(Icons.lock_outline),
                prefixIconColor: Config.primaryColor,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obsecurePass = !obsecurePass;
                      });
                    },
                    icon: obsecurePass
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.black38,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                            color: Config.primaryColor,
                          ))),
          ),
          Config.spaceSmall,
          Consumer<AuthProvider>(
            builder: (context, auth, child) {
              return Button(
                width: double.infinity,
                title: 'Sign In',
                onPressed: () async {
                  //login here
                  FocusScope.of(context).unfocus();
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  if (_formKey.currentState!.validate()) {
                    String login = await auth.singInWithEmail(
                      email: _emailController.text,
                      password: _confirmPassController.text,
                    );

                    if (login == 'Login success!') {
                      Fluttertoast.showToast(
                        msg: 'Welcome ${sharedPreferences.get('displayName')}.',
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                      );
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => ScreenMainPage(),
                          ),
                          (route) => false);
                    } else {
                      Fluttertoast.showToast(
                          msg: 'Login failed. Please try again.',
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.black,
                          textColor: colorGrey);
                    }
                  }
                },
                disable: false,
              );
            },
          )
        ],
      ),
    );
  }
}
