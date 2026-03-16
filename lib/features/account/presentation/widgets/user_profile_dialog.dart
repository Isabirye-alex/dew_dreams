import 'package:flutter/material.dart';

class ProfilePopover extends StatelessWidget {
  final String fullName;
  final String userName;
  final String? email;
  final String? avatarUrl;
  final VoidCallback onLogout;

  const ProfilePopover({
    super.key,
    required this.fullName,
    required this.userName,
    this.email,
    this.avatarUrl,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 280, // fixed width
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: avatarUrl != null
                  ? NetworkImage(avatarUrl!)
                  : null,
              child: avatarUrl == null ? Icon(Icons.person, size: 30) : null,
            ),
            SizedBox(height: 12),
            Text(fullName, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text("@$userName", style: TextStyle(color: Colors.grey[600])),
            if (email != null) ...[
              SizedBox(height: 4),
              Text(email!, style: TextStyle(color: Colors.grey[600])),
            ],
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: onLogout,
                icon: Icon(Icons.logout),
                label: Text("Log Out"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
