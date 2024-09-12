import 'package:frontend_template/shared/providers/my_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
  Account({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<MyAuthProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10.0, top: 5.0),
          child: Text(
            'Tu cuenta TCMS',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25.0, top: 10.0),
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                  child: Text(
                    authProvider.user?.displayName ?? "Invitado",
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                  child: Text(
                    authProvider.user?.email ?? "No se registra email",
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40),
              child: SizedBox(
                width: 20,
                height: 20,
                child: Icon(Icons.settings),
              ),
            ),
          ],
        ),
        /* logoutSessionButton(), */
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TextButton.icon(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 15.0,
                  left: 20.0,
                  right: 20.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(
                Icons.exit_to_app,
                size: 18,
              ),
              label: const Text('Cerrar sesión'),
              onPressed: () async {
                await authProvider.signOut();
                context.go('/login');
              },
            ),
          ),
        ),
        /* logoutSuiteButton(), */
        /* Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TextButton.icon(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 15.0,
                  left: 20.0,
                  right: 20.0,
                ),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.blue,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(
                Icons.apps,
                size: 18,
              ),
              label: const Text('Salir a TCMS'),
              onPressed: () => {},
            ),
          ),
        ) */
      ],
    );
  }

  Center logoutSuiteButton() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: TextButton.icon(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.only(
              top: 15.0,
              bottom: 15.0,
              left: 20.0,
              right: 20.0,
            ),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Colors.blue,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          icon: const Icon(
            Icons.apps,
            size: 18,
          ),
          label: const Text('Salir a TCMS'),
          onPressed: () => {},
        ),
      ),
    );
  }
}
