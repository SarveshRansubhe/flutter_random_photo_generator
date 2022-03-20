import 'package:flutter/material.dart';
import 'package:random_photo_generator/api/api.dart';
import 'package:random_photo_generator/api/random_img_api.dart';

class RandomImgScreen extends StatefulWidget {
  const RandomImgScreen({Key? key}) : super(key: key);

  @override
  State<RandomImgScreen> createState() => _RandomImgScreenState();
}

class _RandomImgScreenState extends State<RandomImgScreen> {
  late Future<RandomPhotoModel> _randomPhotoModel;

  @override
  void initState() {
    _randomPhotoModel = RandomImgApiManager.getRandomImg();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Random Image Generator")),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: [
              FutureBuilder<RandomPhotoModel>(
                future: _randomPhotoModel,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Image.network((snapshot.data!.urls.raw.toString()),
                            fit: BoxFit.contain),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(snapshot.data!.description.toString())
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
