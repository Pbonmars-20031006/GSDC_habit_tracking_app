import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../hive_models/carddetails.dart';
import 'rounded_button.dart';

class CustomCard extends StatefulWidget {
  final cardetails? carddetails;

  final Function(String widget_name, int count) onClickedDone;

  const CustomCard({
    Key? key,
    this.carddetails,
    required this.onClickedDone,
  }) : super(key: key);
  //TextEditingController _widgetname = new TextEditingController();

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  final formkey = GlobalKey<FormState>();
  final widget_namecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.carddetails != null) {
      final carddetails = widget.carddetails!;

      widget_namecontroller.text = carddetails.widget_name;
    }
  }

  @override
  void dispose() {
    widget_namecontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.carddetails != null;
    final title = isEditing ? 'Edit Card' : 'Add Card';

    return AlertDialog(
      title: Text(title),
      content: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 8),
              buildWidgetName(),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        buildCancelButton(context),
        buildAddButton(context, isEditing: isEditing),
      ],
    );
  }

  Widget buildWidgetName() => TextFormField(
        controller: widget_namecontroller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Name',
        ),
        validator: (widget_name) =>
            widget_name != null && widget_name.isEmpty ? 'Enter a name' : null,
      );

  Widget buildCancelButton(BuildContext context) => TextButton(
        child: Text('Cancel'),
        onPressed: () => Navigator.of(context).pop(),
      );

  Widget buildAddButton(BuildContext context, {required bool isEditing}) {
    final text = isEditing ? 'Save' : 'Add';

    return TextButton(
      child: Text(text),
      onPressed: () async {
        final isValid = formkey.currentState!.validate();

        if (isValid) {
          final name = widget_namecontroller.text;
          widget.onClickedDone(name, 0);

          Navigator.of(context).pop();
        }
      },
    );
  }
}
