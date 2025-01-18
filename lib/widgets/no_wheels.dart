import 'package:flutter/material.dart';

class NoWheels extends StatelessWidget {
  const NoWheels({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 4),
          Row(
            children: [
              Text(
                'Your Created Wheels',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'w600',
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            'No wheels are available right now.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'w900',
            ),
          ),
          SizedBox(height: 8),
          Text(
            'To create one, simply click the \'Create New Wheel\' button and follow the steps to customize your own wheel',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff6B7E90),
              fontSize: 14,
              fontFamily: 'w600',
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
