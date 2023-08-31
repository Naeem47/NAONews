import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news/View/HomeView.dart';
import 'package:news/View/LoginView.dart';


class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream:FirebaseAuth.instance.authStateChanges() ,builder:(context, snapshot) {
        if(snapshot.hasData){
          return  HomeView();
        }else{
         return  const  LoginView();
        }
      } , ),
    );
  }
}