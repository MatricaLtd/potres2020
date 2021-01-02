import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  CustomForm(this.formId) : super();

  final int formId;

  @override
  CustomFormState createState() {
    return CustomFormState();
  }
}

// Create a corresponding State class, which holds data related to the form.
class CustomFormState extends State<CustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Card(
        child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.category),
              hintText: 'Upišite vrstu pomoći',
              labelText: 'Vrsta',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Molim upišite vrstu pomoći';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.book_sharp),
              hintText: 'Upišite opis pomoći',
              labelText: 'Opis pomoći',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Molim upišite opis pomoći';
              }
              return null;
            },
          ),
          TextFormField(
            maxLines: 10,
            decoration: const InputDecoration(
                icon: const Icon(Icons.book),
                hintText: 'Upišite duži opis pomoći',
                labelText: 'Duži opis pomoći',
                alignLabelWithHint: true),
            validator: (value) {
              if (value.isEmpty) {
                return 'Molim upišite duži opis pomoći';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.phone),
              hintText: 'Unesite broj telefona',
              labelText: 'Telefon',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Molim upišite valjani broj telefona';
              }
              return null;
            },
          ),
          // TextFormField(
          //   decoration: const InputDecoration(
          //   icon: const Icon(Icons.calendar_today),
          //   hintText: 'Enter your date of birth',
          //   labelText: 'Dob',
          //   ),
          //   validator: (value) {
          //     if (value.isEmpty) {
          //       return 'Please enter valid date';
          //     }
          //     return null;
          //   },
          //  ),
          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              child: new RaisedButton(
                child: const Text('Pošalji'),
                onPressed: () {
                  // It returns true if the form is valid, otherwise returns false
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text("Podaci se šalju ...")));
                  }
                },
              )),
        ],
      ),
    ));
  }
}
