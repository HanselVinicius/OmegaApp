import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void midiaPermision(BuildContext context) async{
    if(await Permission.camera.request().isGranted && await Permission.
        storage.request().isGranted ){
        return;
    }else{
        Navigator.of(context).pop();

    }

}

Future<String> encodeImageFileToBase64(XFile file) async {
    final bytes = await file.readAsBytes();
    final base64Str = base64Encode(bytes);
    return base64Str;
}

