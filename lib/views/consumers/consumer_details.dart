import 'dart:io';

import 'package:eshemachoch_web_application/constants/api.dart';
import 'package:eshemachoch_web_application/viewmodels/adminstrator/adminstrator_model.dart';
import 'package:eshemachoch_web_application/viewmodels/consumer/consumer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' hide Consumer;
import 'package:image_picker/image_picker.dart';
import 'package:eshemachoch_web_application/models/consumer.dart';

class ConsumerDetails extends StatefulWidget {
  const ConsumerDetails({Key? key, this.consumer}) : super(key: key);
  final Consumer? consumer;
  static const route = '/consumer';
  @override
  ConsumerDetailsState createState() => ConsumerDetailsState();
}

class ConsumerDetailsState extends State<ConsumerDetails> {
  final formKey = GlobalKey<FormState>();
  FormState get form => formKey.currentState!;

  Consumer? consumer;
  XFile? pickedImage;
  @override
  Widget build(BuildContext context) {
    var edit = widget.consumer != null;
    final adminstrator = context.read<AdminstratorModel>().adminstrator;

    handleAdding() {
      if (form.validate()) {
        consumer = Consumer.empty();
        form.save();
        context.read<ConsumerModel>().addConsumer(consumer!, pickedImage!);
        Navigator.pop(context);
      }
    }

    handleUpdating() {
      if (form.validate()) {
        consumer = Consumer.empty();
        form.save();
        if (widget.consumer! != consumer!) {
          consumer = consumer?.copyWith(id: widget.consumer!.id!);
          consumer = consumer?.copyWith(image: widget.consumer!.image);
          context.read<ConsumerModel>().updateConsumer(consumer!);
        }
        if (pickedImage != null) {
          context
              .read<ConsumerModel>()
              .updateImage(pickedImage!, widget.consumer!.image);
        }
        Navigator.pop(context);
      }
    }

    void handlePickingImage() async {
      final file = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        pickedImage = file;
      });
    }

    var imageExists = pickedImage != null || edit;
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${edit ? 'Edit' : 'Add'} Consumer'),
          actions: [
            if (edit)
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  context.read<ConsumerModel>().deleteConsumer(consumer!);
                },
              )
          ],
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!imageExists) Icon(Icons.image),
                    if (imageExists)
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(
                            pickedImage != null
                                ? pickedImage!.path
                                : '$BASEURL/consumers/images/${widget.consumer!.image}',
                            fit: BoxFit.cover,
                            headers: {
                              HttpHeaders.authorizationHeader:
                                  adminstrator!.token!,
                            }),
                      ),
                    ElevatedButton(
                      child: Text('${edit ? 'Change' : 'Upload'}  Photo'),
                      onPressed: handlePickingImage,
                    )
                  ],
                ),
                TextFormField(
                  initialValue: widget.consumer?.name,
                  decoration: InputDecoration(
                    labelText: 'Enter Name',
                    hintText: widget.consumer?.name,
                  ),
                  onSaved: (value) {
                    consumer = consumer?.copyWith(name: value);
                  },
                ),
                TextFormField(
                  initialValue: widget.consumer?.phoneNumber,
                  decoration: InputDecoration(
                    labelText: 'Enter Phone Number',
                    hintText: widget.consumer?.phoneNumber,
                  ),
                  onSaved: (value) {
                    consumer = consumer?.copyWith(phoneNumber: value!);
                  },
                ),
                TextFormField(
                  initialValue: widget.consumer?.familySize.toString(),
                  decoration: InputDecoration(
                      labelText: 'Enter Family Size',
                      hintText: widget.consumer?.familySize.toString()),
                  onSaved: (value) {
                    consumer =
                        consumer?.copyWith(familySize: int.parse(value!));
                  },
                ),
                TextFormField(
                  initialValue: widget.consumer?.district,
                  decoration: InputDecoration(
                    labelText: 'Enter District',
                    hintText: widget.consumer?.district,
                  ),
                  onSaved: (value) {
                    consumer = consumer?.copyWith(district: value!);
                  },
                ),
                TextFormField(
                  initialValue: widget.consumer?.subCity,
                  decoration: InputDecoration(
                    labelText: 'Enter Sub-City',
                    hintText: widget.consumer?.subCity,
                  ),
                  onSaved: (value) {
                    consumer = consumer?.copyWith(subCity: value);
                  },
                ),
                TextFormField(
                  initialValue: widget.consumer?.houseNumber.toString(),
                  decoration: InputDecoration(
                    labelText: 'Enter House Number',
                    hintText: widget.consumer?.houseNumber.toString(),
                  ),
                  onSaved: (value) {
                    consumer =
                        consumer?.copyWith(houseNumber: int.parse(value!));
                  },
                ),
                TextFormField(
                  initialValue: widget.consumer?.block,
                  decoration: InputDecoration(
                    labelText: 'Enter Block',
                    hintText: widget.consumer?.block,
                  ),
                  onSaved: (value) {
                    consumer = consumer?.copyWith(block: value!);
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: edit ? handleUpdating : handleAdding,
        ),
      ),
    );
  }
}
