import 'package:amar_tali_app/data/repositories/auth_repository.dart';
import 'package:amar_tali_app/data/repositories/network_repository.dart';
import 'package:amar_tali_app/presentation/Common/custom_textfield.dart';
import 'package:amar_tali_app/presentation/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/repositories/firebase_setup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //
  // late NetworkRepository netConnectivity = NetworkRepository();

  // ConnectivityResult _connectionStatus = ConnectivityResult.none;
  // final Connectivity _connectivity = Connectivity();
  // late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final _formKey6 = GlobalKey<FormState>();
  // StoreController storeController = Get.find();
  //
  // AuthController authController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // AuthController authController = Get.find();
    var authenticationRepository = Provider.of<AuthenticationRepository>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
        Consumer<NetworkStatus>(builder: (context, data, child) {
           return  data == NetworkStatus.Online ?
           const Text('Login ', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18)) :
           const Text('Offline ', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18));
          }
        )
          ],
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Container(
                height: size.height * .84,
                width: size.width,
                decoration:  BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight:Radius.circular(25))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40,top: 20,bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      const SizedBox(height: 150,),
                      const Text('Sign in Glitz Admin Panel',style: TextStyle(color: Colors.lightGreen,fontSize: 23,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 35,),
                      Form(
                        key: _formKey6,
                        child: Column(
                          children: [
                            CustomTextField(name: 'Email', controller: emailController, prefixIcon: Icons.email, inputType: TextInputType.emailAddress, hintText: 'Please Enter valid Email',),
                            const SizedBox(height: 5,),
                            CustomTextField(obscureText: true, name: 'Password', controller: passwordController, prefixIcon: Icons.password, inputType: TextInputType.visiblePassword, hintText: 'Please Enter valid password',),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text('Forget password?',style: TextStyle(color: Colors.black.withOpacity(.4)),),
                      const SizedBox(height: 20,),
                      Container(
                        height: 50,
                        width: size.width * 5,
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.red
                        ),
                        child: TextButton(
                          style: const ButtonStyle(),
                          onPressed: () async {
                            if (_formKey6.currentState!.validate()) {
                              await authenticationRepository.signInWithEmailAndPassword(emailController.text, passwordController.text, (e) {
                                print(e.toString());
                              }).then((value){
                                emailController.clear();
                                passwordController.clear();
                              });
                              if(authenticationRepository.isLoggedIn == true){
                                print('${authenticationRepository.isLoggedIn} isLoggedin value');
                                print('${auth.currentUser!.uid} Current User');
                                final snackBar = SnackBar(
                                  content: const Text('Welcome Admin!, Let\'s Answer Few Question'),
                                  action: SnackBarAction(
                                    label: '',
                                    onPressed: () {

                                    },
                                  ),
                                );
                                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                // Navigator.push(context, MaterialPageRoute(
                                //     builder: (_) => const SecurityPassScreen()
                                // ));

                              }else{
                                print(authenticationRepository.isLoggedIn.toString() + ' isLoggedin value');
                                final snackBar = SnackBar(
                                  content: const Text('Wrong Admin!' ),
                                  action: SnackBarAction(
                                    label: '',
                                    onPressed: () {
                                      // Some code to undo the change.
                                    },
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
                            }
                          },
                          child: const Text('SIGN IN',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
