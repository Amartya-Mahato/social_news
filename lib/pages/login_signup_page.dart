import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:social_news/utils/email_sign.dart';
import 'package:social_news/utils/google_sign.dart';

class LoginSignUpPage extends StatefulWidget {
  const LoginSignUpPage({super.key});

  @override
  State<LoginSignUpPage> createState() => _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  bool isLogin = true;
  bool isCheck = false;
  String email = '';
  String name = '';
  String number = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red.shade700,
        title: const Text(
          'Social News',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.red.shade700, width: 1.0),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40.00), bottomRight: Radius.circular(40.00))),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isLogin = !isLogin;
                        });
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 2 - 1,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: isLogin ? Colors.red.shade700 : Colors.white,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(40.00),
                                bottomRight: Radius.circular(40.00))),
                        child: Text(
                          'LOGIN',
                          style:
                              TextStyle(fontSize: 20, color: isLogin ? Colors.white : Colors.grey),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isLogin = !isLogin;
                        });
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 2 - 1,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: !isLogin ? Colors.red.shade700 : Colors.white,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(40.00),
                                bottomRight: Radius.circular(40.00))),
                        child: Text(
                          'SIGN UP',
                          style:
                              TextStyle(fontSize: 20, color: !isLogin ? Colors.white : Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: !isLogin,
                child: Container(
                  height: MediaQuery.of(context).size.height - 231,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create an',
                        style: TextStyle(fontSize: 25, color: Colors.red.shade700),
                      ),
                      Text(
                        'Account',
                        style: TextStyle(fontSize: 25, color: Colors.red.shade700),
                      ),
                      TextField(
                        onChanged: (value) {
                          name = value;
                        },
                        decoration: InputDecoration(
                            focusColor: Colors.red.shade700,
                            hintText: 'Jhon doe',
                            labelStyle: const TextStyle(fontSize: 20),
                            suffixIconColor: Colors.red.shade700,
                            label: const Text(
                              'Name',
                              style: TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red.shade700),
                            ),
                            suffixIcon: const Icon(Icons.person)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                            focusColor: Colors.red.shade700,
                            hintText: 'johndoe@gmail.com',
                            labelStyle: const TextStyle(fontSize: 20),
                            suffixIconColor: Colors.red.shade700,
                            label: const Text(
                              'Email',
                              style: TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red.shade700),
                            ),
                            suffixIcon: const Icon(Icons.mail)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'lib/assets/india.png',
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(' IN +91'),
                          const Icon(Icons.arrow_drop_down_sharp),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                number = value;
                              },
                              decoration: InputDecoration(
                                  focusColor: Colors.red.shade700,
                                  hintText: '9028738759',
                                  labelStyle: const TextStyle(fontSize: 20),
                                  suffixIconColor: Colors.red.shade700,
                                  label: const Text(
                                    'Contact no',
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red.shade700),
                                  ),
                                  suffixIcon: const Icon(Icons.call)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        obscureText: true,
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                            focusColor: Colors.red.shade700,
                            hintText: '************',
                            labelStyle: const TextStyle(fontSize: 20),
                            suffixIconColor: Colors.red.shade700,
                            label: const Text(
                              'Password',
                              style: TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red.shade700),
                            ),
                            suffixIcon: const Icon(Icons.lock_outline)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                              activeColor: Colors.red,
                              focusColor: Colors.red.shade700,
                              value: isCheck,
                              onChanged: (bool) {
                                setState(() {
                                  isCheck = !isCheck;
                                });
                              }),
                          const Text('I agree with'),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'term & condition',
                                style: TextStyle(color: Colors.red.shade700),
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an Account? '),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  isLogin = !isLogin;
                                });
                              },
                              child: Text(
                                'Sign In!',
                                style: TextStyle(color: Colors.red.shade700),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),

              Visibility(
                visible: isLogin,
                child: Container(
                  height: MediaQuery.of(context).size.height - 231,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SignIn into your',
                        style: TextStyle(fontSize: 25, color: Colors.red.shade700),
                      ),
                      Text(
                        'Account',
                        style: TextStyle(fontSize: 25, color: Colors.red.shade700),
                      ),
                      TextField(
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                            focusColor: Colors.red.shade700,
                            hintText: 'johndoe@gmail.com',
                            labelStyle: const TextStyle(fontSize: 20),
                            suffixIconColor: Colors.red.shade700,
                            label: const Text(
                              'Email',
                              style: TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red.shade700),
                            ),
                            suffixIcon: const Icon(Icons.person)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        obscureText: true,
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                            focusColor: Colors.red.shade700,
                            hintText: '************',
                            labelStyle: const TextStyle(fontSize: 20),
                            suffixIconColor: Colors.red.shade700,
                            label: const Text(
                              'Password',
                              style: TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red.shade700),
                            ),
                            suffixIcon: const Icon(Icons.lock_outline)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password ?',
                                style: TextStyle(color: Colors.red.shade700),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Login with',
                            style: TextStyle(color: Colors.grey, fontSize: 17),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              GoogleSign.googleLogin(context);
                            },
                            child: Image.asset(
                              'lib/assets/google.png',
                              height: 40,
                              width: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Image.asset(
                              'lib/assets/facebook.png',
                              height: 40,
                              width: 40,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an Account? '),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  isLogin = !isLogin;
                                });
                              },
                              child: Text(
                                'Sign In!',
                                style: TextStyle(color: Colors.red.shade700),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              // const Spacer(),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    isLogin
                        ? EmailSign.loginWithEmailAndPassword(
                            context, email.trim(), password.trim())
                        : EmailSign.signInWithEmailAndPassword(
                            context, email.trim(), password.trim());
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.red.shade700,
                          border: Border.all(color: Colors.red.shade700, width: 1.0),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            isLogin ? 'LOGIN' : 'REGISTER',
                            style: const TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
