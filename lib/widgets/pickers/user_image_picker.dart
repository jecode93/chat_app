import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({Key? key}) : super(key: key);

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  // ignore: unused_field
  late File _pickeImage;
  void _pickedImage() async {
    final pickedImageFile =
        await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _pickeImage = pickedImageFile as File;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey,
          backgroundImage: _pickeImage != null ? FileImage(_pickeImage) : null,
        ),
        TextButton.icon(
          onPressed: _pickedImage,
          icon: Icon(Icons.image),
          label: Text(
            'Add Image',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
