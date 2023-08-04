import 'package:flutter/material.dart';
import 'package:todo_list/i10n/localization_intl.dart';
import 'package:todo_list/model/login_page_model.dart';

import 'bottom_to_top_widget.dart';

class LoginWidget extends StatelessWidget {
  final LoginPageModel loginPageModel;

  const LoginWidget({Key key, @required this.loginPageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final primaryColorLight = Theme.of(context).primaryColorLight;
    final primaryColorDark = Theme.of(context).primaryColorDark;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(left: 400, right: 400),
      child: Form(
        key: loginPageModel.formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BottomToTopWidget(
                  child: TextFormField(
                    validator: (email) =>
                        loginPageModel.logic.validatorEmail(email),
                    keyboardType: TextInputType.text,
                    controller: loginPageModel.emailController,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(textBaseline: TextBaseline.alphabetic),
                    decoration: InputDecoration(
                        hintText: IntlLocalizations.of(context).inputEmail,
                        labelText: IntlLocalizations.of(context).email,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: () => Future.delayed(
                            Duration(milliseconds: 100),
                            () => loginPageModel.emailController?.clear(),
                          ),
                        )),
                  ),
                  index: 0,
                ),
                BottomToTopWidget(
                  child: TextFormField(
                    validator: (password) =>
                        loginPageModel.logic.validatePassword(password),
                    controller: loginPageModel.passwordController,
                    keyboardType: TextInputType.text,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(textBaseline: TextBaseline.alphabetic),
                    decoration: InputDecoration(
                        hintText: IntlLocalizations.of(context).inputPassword,
                        labelText: IntlLocalizations.of(context).password,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                        suffixIcon: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Theme.of(context).primaryColor,
                            disabledForegroundColor: Theme.of(context)
                                .primaryColorLight
                                .withOpacity(0.38),
                            disabledBackgroundColor: Theme.of(context)
                                .primaryColorLight
                                .withOpacity(0.12),
                            splashFactory: InkRipple.splashFactory,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          onPressed: loginPageModel.logic.onForget,
                          child: Text(
                            IntlLocalizations.of(context).forget,
                            textAlign: TextAlign.center,
                          ),
                        )),
                    obscureText: true,
                  ),
                  index: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                BottomToTopWidget(
                  index: 2,
                  child: Container(
                    height: 60,
                    width: size.width - 80,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: primaryColorLight,
                        backgroundColor: primaryColor,
                        disabledForegroundColor:
                            primaryColorLight.withOpacity(0.38),
                        disabledBackgroundColor:
                            primaryColorLight.withOpacity(0.12),
                        splashFactory: InkRipple.splashFactory,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        IntlLocalizations.of(context).logIn,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //shape: RoundedRectangleBorder(
                      //  borderRadius: BorderRadius.circular(40.0)),
                      onPressed: loginPageModel.logic.onLogin,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                BottomToTopWidget(
                  index: 2,
                  child: Container(
                    height: 60,
                    width: size.width - 80,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: primaryColorLight,
                        backgroundColor:
                            primaryColor, // Equivalent to highlightColor
                        splashFactory: InkRipple.splashFactory,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        IntlLocalizations.of(context).haveNoAccount,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //shape: RoundedRectangleBorder(
                      // borderRadius: BorderRadius.circular(40.0),
                      // side: BorderSide(color: primaryColorDark)),
                      onPressed: loginPageModel.logic.onRegister,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
