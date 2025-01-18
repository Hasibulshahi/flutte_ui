import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ProfileView extends StatelessWidget {
  final UserModel userModel;
  final double frontSize = 15, gapBetweenText = 2, headerHeight = 70;

  const ProfileView({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: headerHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: FlutterLogo(size: isSmallScreen ? 100 : 200),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${userModel.firstName} ${userModel.lastName}',
                        style: TextStyle(fontSize: frontSize, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: gapBetweenText),
                      Text(
                        userModel.email,
                        style: TextStyle(fontSize: frontSize, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: gapBetweenText),
                      Text(
                        userModel.phone,
                        style: TextStyle(fontSize: frontSize, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    
                    child: Text('data')
                  )
                ],
              ),
            ),

            Container(
              child: isSmallScreen ? 
              Column(
                children: [
                  Row(
                    children: [
                      Text('button 1'),
                      Text('button 2')
                    ],
                  ),
                ],
              )
              : Row(),
            )
          ],
        ),
      ),
    );
  }
}