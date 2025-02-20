// import 'package:ecommers/controllers/blocs/login_bloc/login_bloc.dart';
// import 'package:ecommers/controllers/blocs/login_bloc/login_event.dart';
// import 'package:ecommers/view/screens/bottom_nav.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// // Import your AuthRepository

// class LoginPage extends StatelessWidget {
//   LoginPage({super.key});

//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocListener<LoginBloc, LoginState>(
//         listener: (context, state) {
//           if (state is LoginSuccess) {
//             Navigator.pushReplacement(
//                 context, MaterialPageRoute(builder: (context) => Bottom_Nav()));
//           } else if (state is LoginFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Login Failed:${state.error}')));
//           }
//         },
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Center(
//             child: Form(
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               key: _formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                  const Text(
//                     "Login",
//                     style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 20),
//                   TextFormField(
//                     controller: _usernameController,
//                     decoration: const InputDecoration(
//                       labelText: "Username (mor_2314)",
//                       border: OutlineInputBorder(),
//                       prefixIcon: Icon(Icons.person),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please enter your username";
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 15),
//                   TextFormField(
//                     controller: _passwordController,
//                     obscureText: true,
//                     decoration: const InputDecoration(
//                       labelText: "Password (83r5^_)",
//                       border: OutlineInputBorder(),
//                       prefixIcon: Icon(Icons.lock),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please enter your password";
//                       }
//                       if (value.length < 6) {
//                         return "Password must be at least 6 characters";
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   BlocBuilder<LoginBloc, LoginState>(
//                     builder: (context, state) {
//                       return ElevatedButton(
//                         onPressed: state is LoginLoading
//                             ? null
//                             : () {
//                                 if (_formKey.currentState!.validate()) {
//                                   BlocProvider.of<LoginBloc>(context).add(
//                                       LoginButtonPressed(
//                                           username: _usernameController.text,
//                                           password: _passwordController.text));
//                                 }
//                               }, // Pass context for snackbar
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 50, vertical: 15),
//                           textStyle: const TextStyle(fontSize: 18),
//                         ),
//                         child: const Text(
//                           "Login",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       );
//                     },
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:ecommers/controllers/blocs/login_bloc/login_bloc.dart';
import 'package:ecommers/controllers/blocs/login_bloc/login_event.dart';
import 'package:ecommers/view/screens/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Bottom_Nav()));
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Login Failed: ${state.error}',
                  style: GoogleFonts.quicksand(),
                ),
                backgroundColor: Colors.red.shade400,
                behavior: SnackBarBehavior.floating,
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0, right: 24, left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  // Logo and Welcome Text
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'QuickCart',
                          style: GoogleFonts.quicksand(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 3,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Welcome back',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Sign in to continue shopping',
                          style: GoogleFonts.quicksand(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),
                  // Login Form
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Username Field
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: "Username",
                            hintText: "mor_2314",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  const BorderSide(color: Colors.black87),
                            ),
                            prefixIcon: const Icon(Icons.person_outline,
                                color: Colors.black87),
                            labelStyle:
                                GoogleFonts.quicksand(color: Colors.black54),
                            hintStyle:
                                GoogleFonts.quicksand(color: Colors.black38),
                          ),
                          style: GoogleFonts.quicksand(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your username";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Password Field
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "83r5^_",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  const BorderSide(color: Colors.black87),
                            ),
                            prefixIcon: const Icon(Icons.lock_outline,
                                color: Colors.black87),
                            labelStyle:
                                GoogleFonts.quicksand(color: Colors.black54),
                            hintStyle:
                                GoogleFonts.quicksand(color: Colors.black38),
                          ),
                          style: GoogleFonts.quicksand(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your password";
                            }
                            if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        // Login Button
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: state is LoginLoading
                                    ? null
                                    : () {
                                        if (_formKey.currentState!.validate()) {
                                          BlocProvider.of<LoginBloc>(context)
                                              .add(
                                            LoginButtonPressed(
                                              username:
                                                  _usernameController.text,
                                              password:
                                                  _passwordController.text,
                                            ),
                                          );
                                        }
                                      },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black87,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  elevation: 0,
                                ),
                                child: state is LoginLoading
                                    ? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                        ),
                                      )
                                    : Text(
                                        "Sign In",
                                        style: GoogleFonts.quicksand(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
