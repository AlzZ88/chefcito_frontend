import 'package:frontend_template/shared/providers/my_auth_provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key, required this.width});
  final double width;
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _isPasswordVisible = false;
  bool _rememberEmail = false;
  final _formKey = GlobalKey<FormState>();
/*   final LoginWidgetController controller = Get.put(LoginWidgetController()); */
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _loadEmail();
    super.initState();
  }

  Future<void> _loadEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _emailController.text = prefs.getString('email') ?? '';
    });
  }

  Future<void> _saveEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_rememberEmail) {
      await prefs.setString('email', _emailController.text);
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese un correo';
    }

    if (!EmailValidator.validate(value)) {
      return 'Por favor ingrese un correo valido siguiendo la estructura correo@dominio.com';
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (_passwordController.text.isEmpty) {
      return 'Por favor ingrese una contraseña valida';
    }
  }

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      _saveEmail();

      try {
        final authProvider =
            Provider.of<MyAuthProvider>(context, listen: false);
        await authProvider.signIn(
            _emailController.text, _passwordController.text);

        if (!authProvider.user!.emailVerified) {
          await AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.scale,
            width: MediaQuery.sizeOf(context).width * 0.6,
            title: 'Error',
            desc: 'Verifique su correo para ganar acceso.',
            btnOkColor: Colors.red,
            btnOkOnPress: () async {},
          ).show();
          await authProvider.signOut();
        } else {
          context.go('/');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-email' ||
            e.code == 'wrong-password' ||
            e.code == 'invalid-credential') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.scale,
            width: MediaQuery.sizeOf(context).width * 0.6,
            title: 'Error',
            desc:
                'Hay un problema con sus credenciales, por favor comuniquese con soporte.',
            btnOkColor: Colors.red,
            btnOkOnPress: () {},
          ).show();
        } else if (e.code == 'too-many-requests') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.scale,
            width: MediaQuery.sizeOf(context).width * 0.6,
            title: 'Error',
            desc:
                'Demasiados inicios de sesion erroneos en poco tiempo, intentelo nuevamente mas tarde.',
            btnOkColor: Colors.red,
            btnOkOnPress: () {},
          ).show();
        }
      }
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: widget.width * 0.15,
          top: 15,
          right: widget.width * 0.15,
          bottom: 15),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bienvenido",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Ingresa tus credenciales para iniciar sesión en la aplicación.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                ValueListenableBuilder(
                  valueListenable: _emailController,
                  builder: (context, TextEditingValue value, __) {
                    return TextFormField(
                      controller: _emailController,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        labelStyle: const TextStyle(color: Colors.black),
                        labelText: 'Correo',
                        hintText: 'micorreo@gmail.com',
                        errorStyle: const TextStyle(color: Colors.red),
                      ),
                      validator: _validateEmail,
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                ValueListenableBuilder(
                  valueListenable: _passwordController,
                  builder: (context, TextEditingValue value, __) {
                    return TextFormField(
                      controller: _passwordController,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        labelStyle: const TextStyle(color: Colors.black),
                        labelText: 'Contraseña',
                        errorStyle: const TextStyle(color: Colors.red),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText: !_isPasswordVisible,
                      validator: _validatePassword,
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _rememberEmail,
                      onChanged: (value) {
                        setState(
                          () {
                            _rememberEmail = value ?? false;
                          },
                        );
                      },
                    ),
                    const Text('Recordar mi correo'),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Readex Pro',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text(
                    "Iniciar sesión",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "¿Olvidaste la contraseña?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'Readex Pro',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
