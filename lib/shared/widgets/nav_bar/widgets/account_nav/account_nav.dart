import 'package:frontend_template/shared/providers/my_auth_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountNav extends StatelessWidget {
  AccountNav({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<MyAuthProvider>(context);
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.12,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.grey),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                authProvider.user?.displayName ?? "Guest User",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontFamily: 'Readex Pro',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                authProvider.user?.email ?? "No email available",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontFamily: 'Readex Pro',
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
