import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Container(
            //BACKGROUND
            height: size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/parkwisebg.png"),
                fit: BoxFit.cover,
              ),
            ),

            child: Column(
              // TITLE/ LOGO/ ONE LINER
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 200,
                ),
                Column(
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Park',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'WISE',
                            style: TextStyle(
                              color: Color.fromRGBO(44, 116, 179, 1),
                              fontFamily: 'Poppins',
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Parking made wise, with parkwise',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 190), //CONTROL LOGIN SLIDE

                Expanded(
                  //LOGIN CONTROLS
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 34, 40, 49),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color.fromARGB(255, 44, 116, 179),
                                width: 1,
                              ),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: "Email or Phone number",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 44, 116, 179),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              // color: Colors.white,
                              // boxShadow: const [
                              //   BoxShadow(color: Colors.blue, blurRadius: 1),
                              // ],
                            ),
                            child: const TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: null,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle registration logic here
                                Navigator.pushNamed(context, '/vehicleSelect');
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            // OutlinedButton(
                            //   onPressed: () {
                            //     // Handle login logic here
                            //   },,
                            //   style: ButtonStyle(
                            //     side: MaterialStateProperty.resolveWith<BorderSide>(
                            //       (Set<MaterialState> states) {
                            //         return const BorderSide(
                            //             color: Color.fromRGBO(44, 116, 179, 1),
                            //             width: 1.0);
                            //       },
                            //     ),
                            //     shape:
                            //         MaterialStateProperty.all<RoundedRectangleBorder>(
                            //       RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(10),
                            //       ),
                            //     ),
                            //   ),
                            //   child: const Text(
                            //     'Login',
                            //     style: TextStyle(color: Colors.white),
                            //   ),
                            // ),
                          ),
                          const SizedBox(height: 20),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            style: ButtonStyle(
                              side:
                                  MaterialStateProperty.resolveWith<BorderSide>(
                                (Set<MaterialState> states) {
                                  return const BorderSide(
                                      color: Color.fromRGBO(44, 116, 179, 1),
                                      width: 1.0);
                                },
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
