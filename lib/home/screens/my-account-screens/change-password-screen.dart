import 'package:flutter/material.dart';

/*
  Need Form Validation
  Need Connection
*/

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  GlobalKey _formKey = GlobalKey();
  InputDecoration buildInputDecoration(IconData icons, String hinttext) {
    return InputDecoration(
      hintText: hinttext,
      prefixIcon: Icon(icons),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.purple, width: 1.5),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.blue,
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.blue,
          width: 1.5,
        ),
      ),
    );
  }

  final password = TextEditingController();
  final newPassword = TextEditingController();
  final confirmNewPassword = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    password.dispose();
    newPassword.dispose();
    confirmNewPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: TextFormField(
                  controller: password,
                  keyboardType: TextInputType.text,
                  decoration: buildInputDecoration(Icons.lock, "Password"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please a Enter Password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: TextFormField(
                  controller: password,
                  keyboardType: TextInputType.text,
                  decoration: buildInputDecoration(Icons.lock, "New Password"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please a Enter new Password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: TextFormField(
                  controller: confirmNewPassword,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration:
                      buildInputDecoration(Icons.lock, "Confirm New Password"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please re-enter new password';
                    }
                    print(password.text);
                    print(confirmNewPassword.text);
                    if (password.text != confirmNewPassword.text) {
                      return "new Password does not match";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    textStyle: TextStyle(
                      color: Colors.white,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.blue, width: 2)),
                  ),
                  onPressed: () {},
                  child: Text("Submit"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
