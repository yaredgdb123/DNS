import 'package:disaster/data/auth/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 3),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  autofillHints: const [AutofillHints.email],
                  initialValue: "JackMJoe@gmail.com",
                  onSaved: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email can't be empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      label: Text("Email"),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        width: 1.0,
                      ))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  autofillHints: const [AutofillHints.password],
                  initialValue: "1111",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password can't be empty";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    password = value;
                  },
                  decoration: const InputDecoration(
                      label: Text("Password"),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        width: 1.0,
                      ))),
                ),
                const SizedBox(
                  height: 50,
                ),
                RaisedButton(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                    ),
                    child: Provider.of<LoginProvider>(context).isLoading
                        ? const Center(
                            child: SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : const Center(
                            child: Text(
                              "Login",
                            ),
                          ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        Provider.of<LoginProvider>(context, listen: false)
                            .attemptLogin(email, password);
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
