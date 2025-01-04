import 'package:flutter/material.dart';
import 'package:simphony/features/homepage/bottom_nav.dart';
import 'package:simphony/features/login/locgic/shared_pref_services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final _formKey = GlobalKey<FormState>();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> signInKey = GlobalKey();
  final RegExp textValid = RegExp(r"^\s*[a-zA-Z,\s]+\s*$");
  final nameController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: signInKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'You are almost ready to enjoy the music',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 72),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'name',
                      filled: true,
                      fillColor: const Color(0xFF18191B),
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 202, 174, 174)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide.none),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
                    ),
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      } else if (!textValid.hasMatch(value)) {
                        return 'Please enter a valid name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 60),
                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: () {
                            if (signInKey.currentState!.validate()) {
                              setSharedprefValue();
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => BottomNav()),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF9074F7),
                            foregroundColor: Colors.white,
                          ),
                          child: Text('Sign In'),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> setSharedprefValue() async {
    final name = nameController.text.trim();
    SharedprefServices.saveName(name);
  }
}
