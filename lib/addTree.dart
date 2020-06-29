
import 'package:flutter/material.dart';

class addTree extends StatefulWidget {
  @override
  _addTreeState createState() => _addTreeState();
}

class _addTreeState extends State<addTree> {

  String _buildId;
  String _buildWater;
  String _buildGraden;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildGarden() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Incharge', hintText: 'eg. GIDXXXX'),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Gardener is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _buildGraden = value;
      },
    );
  }

  Widget _buildID() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Tree ID', hintText: 'eg. SACXXXX'),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'tree ID is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _buildId = value;
      },
    );
  }

  Widget _buildQuantity() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Water Quantity', hintText: 'eg. 500 ml'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int quantity = int.tryParse(value);

        if (quantity == null || quantity <= 0) {
          return 'Water quanity must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        _buildWater = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30),
              Transform.translate(
                offset: Offset(0, 0),
                child: SizedBox(
                  width: 237.0,
                  height: 56.0,
                  child: Text(
                    'ADD TREES',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 40,
                      color: const Color(0xff444444),
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              
              
              _buildID(),
              _buildQuantity(),
              _buildGarden(),

              SizedBox(height: 80),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.white)),
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();

                  //Send to API
                },
              )
            ],
          ),
        ),
      );
  }
}