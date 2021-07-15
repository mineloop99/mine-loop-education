import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/*
  Need Form Validation
  Need Connection
*/

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String _setDate = '';
  int _genderValue;

  InputDecoration buildInputDecoration(
      IconData icons, String label, String hinttext) {
    return InputDecoration(
      labelText: label,
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
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.blue,
          width: 1.5,
        ),
      ),
      disabledBorder: OutlineInputBorder(
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

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  void _trySubmit() {
    FocusScope.of(context).unfocus();
    bool _isValid = _formKey.currentState.validate();
    if (_isValid) {
      _formKey.currentState.save();
    }
  }

  final password = TextEditingController();
  final newPassword = TextEditingController();
  final confirmNewPassword = TextEditingController();
  final phoneNumber = TextEditingController();
  final email = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    password.dispose();
    newPassword.dispose();
    confirmNewPassword.dispose();
    phoneNumber.dispose();
    email.dispose();
    _dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  //Background Image
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://i.pinimg.com/564x/aa/b1/2e/aab12e7cafcc79f2bf8f2f7c84bbc784.jpg'),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 150,
                            child: Image.network(
                                'https://i.pinimg.com/originals/09/88/4d/09884d0cb7ccb1bbd23ad16acdba3ffe.jpg'),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.camera_alt_outlined),
                              onPressed: () {},
                              iconSize: 35,
                            ),
                            const SizedBox(width: 20),
                            IconButton(
                              icon: Icon(Icons.upload_file),
                              onPressed: () {},
                              iconSize: 35,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.camera_alt_outlined),
                      onPressed: () {},
                      iconSize: 35,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: TextFormField(
                  controller: password,
                  keyboardType: TextInputType.text,
                  decoration: buildInputDecoration(
                      Icons.person_outlined, 'Your Name', 'Enter Your name...'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter a valid name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: TextFormField(
                          enabled: false,
                          keyboardType: TextInputType.text,
                          controller: _dateController,
                          onSaved: (val) {
                            _setDate = val;
                          },
                          decoration: buildInputDecoration(
                            Icons.calendar_today_outlined,
                            'Birth Day',
                            'Pick Birth Date',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      fit: FlexFit.tight,
                      child: DropdownButtonFormField(
                        value: _genderValue,
                        onChanged: (value) {
                          setState(() {
                            _genderValue = value;
                          });
                        },
                        decoration: buildInputDecoration(
                            Icons.person, 'Gender', 'Gender'),
                        items: [
                          DropdownMenuItem(
                            value: 0,
                            child: Text("Male"),
                          ),
                          DropdownMenuItem(
                            value: 1,
                            child: Text("Female"),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text("Other"),
                          ),
                        ],
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please provide a gender field';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: TextFormField(
                  controller: phoneNumber,
                  keyboardType: TextInputType.number,
                  decoration: buildInputDecoration(
                    Icons.phone_android_outlined,
                    'Phone Number',
                    'Enter your phone number...',
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: TextFormField(
                  controller: email,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: buildInputDecoration(
                      Icons.email_outlined, 'Email', 'Enter email address...'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter a valid email address';
                    }
                    print(password.text);
                    print(confirmNewPassword.text);
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    textStyle: TextStyle(
                      color: Colors.white,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.blue, width: 2)),
                  ),
                  onPressed: _trySubmit,
                  child: Text("Submit"),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    textStyle: TextStyle(
                      color: Colors.white,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.blue, width: 2)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
