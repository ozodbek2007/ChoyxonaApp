import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled2/choyxona_app/presentation/screens/single_screens/welcome_page.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _LocationPageState();
}

class _LocationPageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Center(
        child: SizedBox(
          height: 60,
          width: 150,
          child: InkWell(
            onTap: ()=>navigatePushRemove(context, WelcomePage()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("EXIT",style: TextStyle(color: Colors.red,fontSize: 20)),
                const Gap(10),
                Icon(Icons.exit_to_app,color: Colors.red)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
