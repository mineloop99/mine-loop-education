import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mine_loop_education/dialog-pop-up/normal-dialog-popup.dart';
import 'package:provider/provider.dart';
import '../../../grpc/account-information/account-information-client.dart';
import '../../providers/my-account-provider.dart';

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
  String name;
  String phoneNumber;
  DateTime _birthday;
  String _sex;

  final selectedDay = TextEditingController();
  var firstSelect;

  AsyncMemoizer<String> _asyncMemoizer;

  InputDecoration buildInputDecoration(IconData icons, String label,
      String hinttext, bool _isSuffixIcon, IconData icon) {
    return InputDecoration(
      labelText: label,
      suffixIcon: _isSuffixIcon ? Icon(icon) : null,
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
      initialDate: _birthday,
      initialDatePickerMode: DatePickerMode.year,
      firstDate: DateTime(1960),
      lastDate: DateTime.now(),
    );
    if (picked != null)
      setState(() {
        _birthday = picked;
        selectedDay.text = DateFormat.yMMMd().format(_birthday);
        FocusScope.of(context).unfocus();
      });
  }

  _fetchData() async {
    return this._asyncMemoizer.runOnce(() async {
      final respone = await AccountInformationAPI.instance
          .callFetchAccountInformation(context);
      return respone;
    });
  }

  void _trySubmit() {
    FocusScope.of(context).unfocus();
    bool _isValid = _formKey.currentState.validate();
    if (_isValid) {
      _formKey.currentState.save();
      showDialog(
          context: context,
          builder: (ctx) => NormalDialogPopup(
                methodCall:
                    AccountInformationAPI.instance.callEditAccountInformation(
                  userBirthday: _birthday,
                  userPhoneNumber: phoneNumber,
                  userSex: _sex,
                  username: name,
                ),
                twoTextButton: false,
                showSnackBarMessage: "PROFILE_UPDATED",
                contextSnackBarMessage: context,
                methodCallWhenPressOk: () {
                  Navigator.of(context).pop();
                },
              ));
    }
  }

  @override
  void initState() {
    _asyncMemoizer = AsyncMemoizer();
    firstSelect = true;
    super.initState();
  }

  @override
  void dispose() {
    selectedDay.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: FutureBuilder(
        future: _fetchData(),
        builder: (_, snapshot) => !snapshot.hasData
            ? Center(child: CircularProgressIndicator())
            : Consumer<MyAccountProvider>(builder: (_, _accountProvider, __) {
                _sex = _accountProvider.userInformation.sex;
                _birthday = _accountProvider.userInformation.birthday;
                if (firstSelect) {
                  firstSelect = false;
                  selectedDay.text = DateFormat.yMMMd().format(_birthday);
                }
                return SingleChildScrollView(
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
                          padding: const EdgeInsets.only(
                              bottom: 15, left: 10, right: 10),
                          child: TextFormField(
                            initialValue: _accountProvider.userInformation.name,
                            keyboardType: TextInputType.text,
                            decoration: buildInputDecoration(
                                Icons.person_outlined,
                                'Your Name',
                                'Enter Your name...',
                                true,
                                Icons.edit),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter a valid name';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              setState(() {
                                name = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, left: 10, right: 10),
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
                                    controller: selectedDay,
                                    decoration: buildInputDecoration(
                                        Icons.calendar_today_outlined,
                                        'Birthday',
                                        'Pick Birth Date',
                                        false,
                                        Icons.edit),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Flexible(
                                fit: FlexFit.tight,
                                child: DropdownButtonFormField<String>(
                                  value: _sex,
                                  decoration: buildInputDecoration(Icons.person,
                                      'Gender', '', false, Icons.edit),
                                  items: [
                                    DropdownMenuItem(
                                      value: "Male",
                                      child: Text("Male"),
                                    ),
                                    DropdownMenuItem(
                                      value: "Female",
                                      child: Text("Female"),
                                    ),
                                    DropdownMenuItem(
                                      value: "Other",
                                      child: Text("Other"),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      _sex = value;
                                    });
                                  },
                                  onSaved: (value) {
                                    if (_sex.isEmpty)
                                      _sex =
                                          _accountProvider.userInformation.sex;
                                    else
                                      _sex = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, left: 10, right: 10),
                          child: TextFormField(
                            initialValue:
                                _accountProvider.userInformation.phoneNumber,
                            keyboardType: TextInputType.number,
                            decoration: buildInputDecoration(
                                Icons.phone_android_outlined,
                                'Phone Number',
                                '+8488888...',
                                true,
                                Icons.edit),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter a valid number';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              setState(() {
                                phoneNumber = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, left: 10, right: 10),
                          child: TextFormField(
                            initialValue:
                                _accountProvider.userInformation.email,
                            enabled: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: buildInputDecoration(
                                Icons.email_outlined,
                                'Email',
                                'Enter Email...',
                                true,
                                Icons.edit_off),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter a valid email address';
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
                              primary: Colors.blue,
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side:
                                      BorderSide(color: Colors.blue, width: 2)),
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
                                  side:
                                      BorderSide(color: Colors.blue, width: 2)),
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
                );
              }),
      ),
    );
  }
}
