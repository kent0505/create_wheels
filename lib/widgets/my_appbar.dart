import 'package:flutter/material.dart';

import '../pages/settings_page.dart';
import 'button.dart';
import 'svg_widget.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({
    super.key,
    required this.title,
    this.home = false,
    this.asset = '',
    this.onPressed,
  });

  final String title;
  final bool home;
  final String asset;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: Row(
        children: [
          SizedBox(width: 16),
          if (home) ...[
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'w700',
                ),
              ),
            ),
            _Button(
              asset: 'settings',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SettingsPage();
                    },
                  ),
                );
              },
            ),
          ] else ...[
            _Button(
              asset: 'back',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'w900',
                  ),
                ),
              ),
            ),
            asset.isEmpty
                ? SizedBox(width: 52)
                : _Button(
                    asset: asset,
                    onPressed: onPressed,
                  ),
          ],
          SizedBox(width: 16),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.asset,
    required this.onPressed,
  });

  final String asset;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      child: Container(
        height: 52,
        width: 52,
        decoration: BoxDecoration(
          color: Color(0xff07223D),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: SvgWidget('assets/$asset.svg'),
        ),
      ),
    );
  }
}
