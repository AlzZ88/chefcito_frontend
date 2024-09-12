import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup_widget_controller.dart';
import 'package:email_validator/email_validator.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key, required this.width});
  final double width;
  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  final _formKey = GlobalKey<FormState>();
  final SignupWidgetController controller = Get.put(SignupWidgetController());
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _hasUpperCase = false;
  bool _hasLowerCase = false;
  bool _hasDigits = false;
  bool _hasSpecialCharacters = false;
  bool _hasMinLength = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      _onPasswordChanged(_passwordController.text);
    });
  }

  void _onPasswordChanged(String password) {
    setState(() {
      _hasUpperCase = password.contains(RegExp(r'[A-Z]'));
      _hasLowerCase = password.contains(RegExp(r'[a-z]'));
      _hasDigits = password.contains(RegExp(r'[0-9]'));
      _hasSpecialCharacters = password.contains(RegExp(r'[!@#\$&*~]'));
      _hasMinLength = password.length >= 8;
    });
  }

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese un nombre';
    }

    // Trim the value to remove leading and trailing spaces
    final trimmedValue = value.trim();

    // Check if the value contains exactly one space
    final parts = trimmedValue.split(' ');
    if (parts.length != 2 || parts[0].isEmpty || parts[1].isEmpty) {
      return 'Debe utilizar el formato "nombre apellido" separado por un espacio.';
    }

    return null;
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

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor confirme su contraseña';
    }

    if (value != _passwordController.text) {
      return 'Las contraseñas deben ser las mismas';
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (!_hasDigits ||
        !_hasLowerCase ||
        !_hasMinLength ||
        !_hasSpecialCharacters ||
        !_hasUpperCase) {
      return 'Por favor ingrese una contraseña valida';
    }

    return null;
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Show the loading dialog
      AwesomeDialog(
        context: context,
        dialogType: DialogType.noHeader,
        animType: AnimType.scale,
        dismissOnTouchOutside: false,
        dismissOnBackKeyPress: false,
        width: MediaQuery.sizeOf(context).width * 0.6,
        body: const Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Creando cuenta...'),
          ],
        ),
      ).show();

      // Attempt to sign up
      String code = await controller.signup(
        _emailController.text,
        _nameController.text,
        _passwordController.text,
        context,
      );

      // Close the loading dialog
      Navigator.of(context).pop();

      if (code == 'success') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.scale,
          width: MediaQuery.sizeOf(context).width * 0.6,
          title: 'Success',
          desc:
              'Hemos enviado un enlace de verificación a su correo electronico.',
          btnOkOnPress: () {},
        ).show();
      } else if (code == 'email-already-in-use') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.scale,
          width: MediaQuery.sizeOf(context).width * 0.6,
          title: 'Error',
          desc:
              'Existe un problema con sus credenciales, contactese con soporte.',
          btnOkColor: Colors.red,
          btnOkOnPress: () {},
        ).show();
      }
    }
  }

  Widget _buildPasswordCriteria(String criteria, bool conditionMet) {
    return Row(
      children: [
        Icon(
          conditionMet ? Icons.check_circle : Icons.cancel,
          color: conditionMet ? Colors.green : Colors.red,
        ),
        SizedBox(width: 10),
        Text(criteria),
      ],
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
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
                    "Crear Cuenta",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Ingresa las credenciales para la creación  de la cuenta.",
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
                    valueListenable: _nameController,
                    builder: (context, TextEditingValue value, __) {
                      return TextFormField(
                        controller: _nameController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          labelStyle: const TextStyle(color: Colors.black),
                          labelText: 'Nombre',
                          hintText: 'Nombre Apellido',
                          errorStyle: const TextStyle(color: Colors.red),
                        ),
                        validator: _validateUsername,
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
                  _passwordController.text.isEmpty
                      ? Container()
                      : Column(children: [
                          SizedBox(height: 15),
                          _buildPasswordCriteria(
                              'Mínimo 8 letras', _hasMinLength),
                          _buildPasswordCriteria(
                              'Mínimo 1 letra mayuscula', _hasUpperCase),
                          _buildPasswordCriteria(
                              'Mínimo 1 letra minuscula', _hasLowerCase),
                          _buildPasswordCriteria('Mínimo 1 número', _hasDigits),
                          _buildPasswordCriteria('Mínimo 1 carácter especial',
                              _hasSpecialCharacters),
                        ]),
                  const SizedBox(
                    height: 15,
                  ),
                  ValueListenableBuilder(
                    valueListenable: _confirmPasswordController,
                    builder: (context, TextEditingValue value, __) {
                      return TextFormField(
                        controller: _confirmPasswordController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          labelStyle: const TextStyle(color: Colors.black),
                          labelText: 'Confirmar Contraseña',
                          errorStyle: const TextStyle(color: Colors.red),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isConfirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  _isConfirmPasswordVisible =
                                      !_isConfirmPasswordVisible;
                                },
                              );
                            },
                          ),
                        ),
                        obscureText: !_isConfirmPasswordVisible,
                        validator: _validateConfirmPassword,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        textStyle: const TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.bold,
                        )),
                    child: const Text(
                      "Registrase",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
