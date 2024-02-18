import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'check_sms.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final  _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body:  Padding(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(alignment:Alignment.center,child: Text("Parolni unutdingizmi?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),)),
              Align(
                alignment:Alignment.center,
                child: SizedBox(
                  width: 346,
                  height: 40,
                  child: Text("Xavotir olmang! Bo'lib turadi. Hisobingiz bilan bog'langan telefon raqamingizni kiriting."),
                ),
              ),
              Gap(30),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 98,
                  height: 18,
                  child: Text("Telefon raqami",style: TextStyle(fontSize: 14,color: Color(0xff000000),),),
                ),
              ),
              Gap(6),
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Telefon raqmingizni kiriting",hintStyle: TextStyle(color: Colors.grey.shade500),
                ),
              ),
              const Gap(50),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color(0xff0bff99),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> const CheckSms()));
                  },
                  child: const Text("Kodni yuboring",style: TextStyle(color: Color(0xffffffff),fontWeight: FontWeight.bold,fontSize: 15),),
                ),
              ),
              const Gap(300),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Parol esingizdami?"),
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: const Text("Tizimga kirish",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}