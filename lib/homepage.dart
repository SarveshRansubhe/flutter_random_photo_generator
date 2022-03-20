import 'package:flutter/material.dart';
import 'package:random_photo_generator/random_img.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
            child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const RandomImgScreen())));
                },
                child: const Text("Random Image"))));
  }
}
