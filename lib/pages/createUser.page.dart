import 'package:demo_users/database/user_dao.dart';
import 'package:demo_users/models/userModel.model.dart';
import 'package:demo_users/utils/formatters.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  final _formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerLastname = TextEditingController();
  final controllerAddress = TextEditingController();
  final controllerDate = TextEditingController();
  late String _birthdate;
  List<UserModel> users = [];
  final dao = UserDao();
  late BuildContext _ctx;
  DateTime selectedDate = DateTime.now();
  final focusName = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerLastname.dispose();
    controllerAddress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return Scaffold(
      appBar: appBar(),
      body: formCreateUser(),
    );
  }

  Widget formCreateUser() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              focusNode: focusName,
              textCapitalization: TextCapitalization.words,
              controller: controllerName,
              decoration: const InputDecoration(
                icon: Icon(Icons.account_circle_outlined),
                labelText: 'Name',
              ),
              maxLength: 50,
              inputFormatters: [
                Formatters.onlyLettersWithoutSpecialLetters(),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Name';
                }
                return null;
              },
            ),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              controller: controllerLastname,
              decoration: const InputDecoration(
                icon: Icon(Icons.account_circle_outlined),
                labelText: 'Lastname',
              ),
              maxLength: 50,
              inputFormatters: [
                Formatters.onlyLettersWithoutSpecialLetters(),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Lastname';
                }
                return null;
              },
            ),
            TextFormField(
              enableInteractiveSelection: false,
              controller: controllerDate,
              decoration: const InputDecoration(
                icon: Icon(Icons.date_range_outlined),
                labelText: "Birthdate",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Birthdate';
                }
                return null;
              },
              onTap: () {
                _selectDate();
              },
            ),
            TextFormField(
              textCapitalization: TextCapitalization.sentences,
              controller: controllerAddress,
              decoration: const InputDecoration(
                icon: Icon(Icons.location_on_outlined),
                labelText: 'Address',
              ),
              maxLength: 100,
              inputFormatters: [
                Formatters.lettersAndNumberAndSpecialCharacters(),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an Address';
                }
                return null;
              },
            ),
            buttonAddUser(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: Row(
        children: const [
          Icon(Icons.account_circle_outlined),
          SizedBox(width: 5),
          Text('UserApp'),
        ],
      ),
    );
  }

  Widget buttonAddUser() {
    return TextButton(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text('Add'),
      ),
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          final name = controllerName.text;
          final lastname = controllerLastname.text;
          final address = controllerAddress.text;
          UserModel user = UserModel(
            name: name,
            lastname: lastname,
            birthdate: _birthdate,
            address: address,
          );
          final id = await dao.insert(user);
          user = user.copyWith(id: id);
          controllerName.clear();
          controllerLastname.clear();
          controllerAddress.clear();
          controllerDate.clear();
          focusName.requestFocus();
          setState(() {
            users.add(user);
          });
        }
      },
    );
  }

  _selectDate() async {
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    FocusScope.of(_ctx).requestFocus(FocusNode());
    DateTime? picked = await showDatePicker(
      locale: const Locale('es', 'ES'),
      context: _ctx,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        controllerDate.value = TextEditingValue(text: formatter.format(picked));
      });
      _birthdate = "${picked.day}/${picked.month}/${picked.year}";
    }
  }
}
