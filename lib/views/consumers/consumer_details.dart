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
  XFile? pickedFile;
  @override
  Widget build(BuildContext context) {
    var edit = widget.consumer != null;
    handleAdding() {
      if (form.validate()) {
        consumer = Consumer.empty();
        form.save();
        context.read<ConsumerModel>().addConsumer(consumer!, pickedFile!);
        Navigator.pop(context);
      }
    }

    handleUpdating() {
      if (form.validate()) {
        form.save();

        if (widget.consumer!.name != consumer!.name ||
            widget.consumer!.block != consumer!.block ||
            widget.consumer!.district != consumer!.district)
          context.read<ConsumerModel>().updateConsumer(consumer!);
        Navigator.pop(context);
      }
    }

    void handlePickingImage() async {
      final file = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        pickedFile = file;
      });
    }

    var imageExists = pickedFile != null || edit;
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
                        child: Image.network(edit ? consumer!.photo : pickedFile!.path,
                            fit: BoxFit.cover),
                      ),
                    ElevatedButton(
                      child: Text('${edit ? 'Change' : 'Upload'}  Photo'),
                      onPressed: handlePickingImage,
                    )
                  ],
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: edit ? widget.consumer!.name : 'Enter Name'),
                  onSaved: (value) {
                    consumer = consumer?.copyWith(name: value);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText:
                          edit ? widget.consumer!.phoneNumber : 'Enter Phone Number'),
                  onSaved: (value) {
                    consumer = consumer?.copyWith(phoneNumber: value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: edit
                          ? widget.consumer!.familySize.toString()
                          : 'Enter Family Size'),
                  onSaved: (value) {
                    consumer = consumer?.copyWith(familySize: int.parse(value!));
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: edit ? widget.consumer!.district : 'Enter District'),
                  onSaved: (value) {
                    consumer = consumer?.copyWith(district: value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: edit ? widget.consumer!.subCity : 'Enter Sub-City'),
                  onSaved: (value) {
                    consumer = consumer?.copyWith(subCity: value);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: edit
                          ? widget.consumer!.houseNumber.toString()
                          : 'Enter House Number'),
                  onSaved: (value) {
                    consumer = consumer?.copyWith(houseNumber: int.parse(value!));
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: edit ? widget.consumer!.block : 'Enter Block'),
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
