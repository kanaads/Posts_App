

import 'package:flutter/material.dart';
import 'package:posts_app/widgets/scaffold_wrapper.dart';

class AboutScreen extends StatelessWidget{
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext StatelessWidget){
    
    return ScaffoldWrapper(
      title: "About",
      child: Scaffold( 
        body: Center(child: Text("About Page"),)

      )
     
    );
  }
}