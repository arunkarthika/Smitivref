import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model.dart';

void showResults(BuildContext context, PonyModel model) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Updated Resultss'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildResultsRow('Name', model.name),
              _buildResultsRow('Type', model.type),
              _buildResultsRow('Age', model.age),
              _buildResultsRow('Description', model.description,
                  linebreak: true),
              _buildResultsRow('Hobbies', model.hobbies, linebreak: true),
              _buildResultsRow(
                  'ShowDate', DateFormat.yMd().format(model.showDateTime)),
              _buildResultsRow(
                  'ShowTime', DateFormat.jm().format(model.showDateTime)),
              _buildResultsRow('Phone', model.boxOfficePhone),
              _buildResultsRow('Price', model.ticketPrice),
              _buildResultsRow('Audio', CardSettingsFilePicker.formatBytes(model.audio?.length ?? 0, 3)),
              _buildResultsRow('Photo', CardSettingsFilePicker.formatBytes(model.photo?.length ?? 0, 2)),
              _buildResultsRow('Video', CardSettingsFilePicker.formatBytes(model.video?.length ?? 0, 1)),
              _buildResultsRow('Custom file', CardSettingsFilePicker.formatBytes(model.customFile?.length ?? 0, 0)),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void showErrors(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Form has validation errors'),
        content: Text('Please fix all errors before submitting the form.'),
        actions: <Widget>[
          FlatButton(
            child: Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Widget _buildResultsRow(String name, dynamic value, {bool linebreak: false}) {
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            child: Text(
              '$name:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          _buildValueInline(value, linebreak),
        ],
      ),
      _buildValueOnOwnRow(value, linebreak),
      Container(height: 12.0),
    ],
  );
}

Widget _buildValueInline(dynamic value, bool linebreak) {
  return (linebreak) ? Container() : Text(value.toString());
}

Widget _buildValueOnOwnRow(dynamic value, bool linebreak) {
  return (linebreak) ? Text(value.toString()) : Container();
}
