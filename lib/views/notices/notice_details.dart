import 'package:eshemachoch_web_application/models/notice.dart';
import 'package:eshemachoch_web_application/viewmodels/notice/notice_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoticeDetails extends StatefulWidget {
  const NoticeDetails({Key? key, this.notice}) : super(key: key);
  final Notice? notice;
  static const route = '/notice';
  @override
  NoticeDetailsState createState() => NoticeDetailsState();
}

class NoticeDetailsState extends State<NoticeDetails> {
  final formKey = GlobalKey<FormState>();
  FormState get form => formKey.currentState!;

  Notice? notice;

  @override
  Widget build(BuildContext context) {
    var edit = widget.notice != null;
    handleAdding() {
      if (form.validate()) {
        notice = Notice.empty();
        form.save();
        notice = notice?.copyWith(date: DateTime.now().millisecondsSinceEpoch);
        context.read<NoticeModel>().addNotice(notice!);
        Navigator.pop(context);
      }
    }

    handleUpdating() {
      if (form.validate()) {
        notice = Notice.empty();
        form.save();
        if (widget.notice! != notice!) notice = notice?.copyWith(id: widget.notice!.id);
        notice = notice?.copyWith(date: DateTime.now().millisecondsSinceEpoch);
        context.read<NoticeModel>().updateNotice(notice!);
        Navigator.pop(context);
      }
    }

    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${edit ? 'Edit' : 'Add'} Notice'),
          actions: [
            if (edit)
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  context.read<NoticeModel>().deleteNotice(notice!);
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
                TextFormField(
                  initialValue: widget.notice?.title,
                  decoration: InputDecoration(
                    labelText: 'Enter Title',
                    hintText: widget.notice?.title,
                  ),
                  onSaved: (value) {
                    notice = notice?.copyWith(title: value);
                  },
                ),
                TextFormField(
                  initialValue: widget.notice?.message,
                  decoration: InputDecoration(
                    labelText: 'Enter Message',
                    hintText: widget.notice?.message,
                  ),
                  onSaved: (value) {
                    notice = notice?.copyWith(message: value);
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
