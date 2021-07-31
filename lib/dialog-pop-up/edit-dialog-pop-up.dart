import 'package:flutter/material.dart';
import 'package:mine_loop_education/grpc/authentication/client.dart';
import 'package:provider/provider.dart';

class EditDialogPopUp extends StatefulWidget {
  final String title;
  final String trueDescription;
  final String falseDescription;
  final String hint;
  final Function methodWhenCallDone;
  final Function navigationWhenOk;
  final Function methodWhenPressCancel;
  const EditDialogPopUp(
      {this.title,
      this.trueDescription,
      this.falseDescription,
      this.hint,
      this.methodWhenCallDone,
      this.navigationWhenOk,
      this.methodWhenPressCancel});

  @override
  _EditDialogPopUpState createState() => _EditDialogPopUpState();
}

class _EditDialogPopUpState extends State<EditDialogPopUp> {
  Key _key = GlobalKey();

  final _futureWaiting = Future.delayed(Duration(milliseconds: 500));
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _controllerTextIsEmpty;
  bool _canPress;
  bool _isValidate;

  Future<void> _myFuture = Future.delayed(Duration(milliseconds: 50));
  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {});
    _controllerTextIsEmpty = true;
    _canPress = false;
    _isValidate = false;
  }

  void _okPresses() {
    setState(() {
      Provider.of<AuthenticationClientProvider>(context, listen: false)
          .setEmail(_controller.text);
    });
    _myFuture = _buildFuture();
  }

  _buildFuture() async {
    final respone =
        await AuthenticationAPI.instance.callForgotPassword(_controller.text);

    if (respone.contains('OK')) {
      widget.navigationWhenOk();
    }
    setState(() {
      _isValidate = true;
    });
    return false;
  }

  void _highlightButton() {
    if (!_controllerTextIsEmpty &&
        _controller.text.contains('@') &&
        _controller.text.contains('.'))
      setState(() {
        _canPress = true;
      });
    else
      setState(() {
        _canPress = false;
      });
  }

  void _clearOnPressed() {
    _controller.clear();
    _controllerTextIsEmpty = true;
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: _futureWaiting,
        builder: (ctx, AsyncSnapshot snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                child: AlertDialog(
                  title: Text(
                    //////////Tiltle
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Column(
                    ////////////Description + TextFormField
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _isValidate //////////Validate
                          ? Text(
                              widget.falseDescription,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.red,
                              ),
                            )
                          : Text(
                              widget.trueDescription,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                      Stack(
                        children: [
                          Form(
                            key: _key,
                            child: TextFormField(
                                controller: _controller,
                                autofocus: true,
                                focusNode: _focusNode,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  hintText: widget.hint,
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _controllerTextIsEmpty = value.isEmpty;
                                    _highlightButton();
                                  });
                                }),
                          ),
                          Positioned.fill(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.clear,
                                      color: _controllerTextIsEmpty
                                          ? Colors.black54
                                          : Colors.blue,
                                    ),
                                    onPressed: _clearOnPressed,
                                  ))),
                        ],
                      )
                    ],
                  ),
                  actions: [
                    FutureBuilder(
                        future: _myFuture,
                        builder: (_, snapshot) {
                          _myFuture = null;
                          return TextButton(
                            onPressed: _canPress ? _okPresses : null,
                            child: snapshot.connectionState ==
                                    ConnectionState.waiting
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Text(
                                    "OK",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                          );
                        }),
                    TextButton(
                      onPressed: widget.methodWhenPressCancel,
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
