import 'package:dew_dreams/features/account/presentation/widgets/user_profile_dialog.dart';
// import 'package:dew_dreams/features/auth/login/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatefulWidget {
  const ProfileButton({super.key});

  @override
  State<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  final GlobalKey _profileIconKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  void _togglePopover() {
    if (_overlayEntry != null) {
      // Remove existing popover
      _overlayEntry!.remove();
      _overlayEntry = null;
      return;
    }

    final renderBox =
        _profileIconKey.currentContext!.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: offset.dy + renderBox.size.height + 5,
        right:
            MediaQuery.of(context).size.width -
            offset.dx -
            renderBox.size.width,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            //  tap outside to close
            _overlayEntry?.remove();
            _overlayEntry = null;
          },
          child: ProfilePopover(
            fullName: "Alex Isabirye",
            userName: "alex123",
            email: "alex@example.com",
            avatarUrl: null,
            onLogout: () {
              _overlayEntry?.remove();
              _overlayEntry = null;
              // onTap;
            },
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: _profileIconKey,
      icon: Icon(Icons.account_circle_outlined, color: Colors.black),
      onPressed: _togglePopover,
    );
  }
}
