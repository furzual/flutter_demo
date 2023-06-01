import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulario Pagos Online',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  String? _urlAction = 'https://test.ipg-online.com/connect/gateway/processing';
  String? _chargetotal = '666.00';
  String? _checkoutoption = 'combinedpage';
  String? _currency = '484';
  String? _hash_algorithm = 'HMACSHA256';
  String? _responseFailURL = 'https://pagosonline.mx/DConnect/response.php';
  String? _responseSuccessURL = 'https://pagosonline.mx/DConnect/response.php';
  String? _storename = '62666666';
  String? _timezone = 'America/Mexico_City';
  String? _txndatetime;
  String? _txntype = 'sale';
  String? _sharedSecret = 'i88E-;KYkS';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario Pagos Online'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: _urlAction,
                  onSaved: (value) => _urlAction = value,
                  decoration: InputDecoration(labelText: 'URL Action'),
                ),
                TextFormField(
                  initialValue: _chargetotal,
                  onSaved: (value) => _chargetotal = value,
                  decoration: InputDecoration(labelText: 'Charge Total'),
                ),
                TextFormField(
                  initialValue: _checkoutoption,
                  onSaved: (value) => _checkoutoption = value,
                  decoration: InputDecoration(labelText: 'Checkout Option'),
                ),
                TextFormField(
                  initialValue: _currency,
                  onSaved: (value) => _currency = value,
                  decoration: InputDecoration(labelText: 'Currency'),
                ),
                TextFormField(
                  initialValue: _hash_algorithm,
                  onSaved: (value) => _hash_algorithm = value,
                  decoration: InputDecoration(labelText: 'Hash Algorithm'),
                ),
                TextFormField(
                  initialValue: _responseFailURL,
                  onSaved: (value) => _responseFailURL = value,
                  decoration: InputDecoration(labelText: 'Response Fail URL'),
                ),
                TextFormField(
                  initialValue: _responseSuccessURL,
                  onSaved: (value) => _responseSuccessURL = value,
                  decoration: InputDecoration(labelText: 'Response Success URL'),
                ),
                TextFormField(
                  initialValue: _storename,
                  onSaved: (value) => _storename = value,
                  decoration: InputDecoration(labelText: 'Store Name'),
                ),
                TextFormField(
                  initialValue: _timezone,
                  onSaved: (value) => _timezone = value,
                  decoration: InputDecoration(labelText: 'Timezone'),
                ),
                                TextFormField(
                  initialValue: _txndatetime,
                  onSaved: (value) => _txndatetime = value,
                  decoration: InputDecoration(labelText: 'Transaction Datetime'),
                ),
                TextFormField(
                  initialValue: _txntype,
                  onSaved: (value) => _txntype = value,
                  decoration: InputDecoration(labelText: 'Transaction Type'),
                ),
                TextFormField(
                  initialValue: _sharedSecret,
                  onSaved: (value) => _sharedSecret = value,
                  decoration: InputDecoration(labelText: 'Shared Secret'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Enviar Formulario'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Construye la petición HTML con los campos y valores
      String htmlRequest = '<html><body>';
      htmlRequest += '<p>urlAction: $_urlAction</p>';
      htmlRequest += '<p>chargetotal: $_chargetotal</p>';
      htmlRequest += '<p>checkoutoption: $_checkoutoption</p>';
      htmlRequest += '<p>currency: $_currency</p>';
      htmlRequest += '<p>hash_algorithm: $_hash_algorithm</p>';
      htmlRequest += '<p>responseFailURL: $_responseFailURL</p>';
      htmlRequest += '<p>responseSuccessURL: $_responseSuccessURL</p>';
      htmlRequest += '<p>storename: $_storename</p>';
      htmlRequest += '<p>timezone: $_timezone</p>';
      htmlRequest += '<p>txndatetime: $_txndatetime</p>';
      htmlRequest += '<p>txntype: $_txntype</p>';
      htmlRequest += '<p>sharedSecret: $_sharedSecret</p>';
      htmlRequest += '</body></html>';

      // Imprime la petición HTML generada
      print(htmlRequest);

      // Continúa con el envío de la petición HTTP
    }
  }
}
