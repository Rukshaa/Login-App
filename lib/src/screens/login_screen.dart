import 'package:flutter/material.dart';
import 'package:login_app/src/mixins/validation_mixin.dart';
import 'package:login_app/src/screens/second_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {

  String? gender;
  String? email;
  String? password;

  // define a global key of type FormState

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(48),
        child: Form(
          key: formKey,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildEmailField(),
                  SizedBox(height: 8),
                  buildPasswordField(),
                  SizedBox(height: 8),
                  buildGenderField(),
                  SizedBox(height: 8),
                  buildSubmitButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "your@example.com",
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder()
      ),
      validator: validateEmail, // passing the reference
      onSaved: (value){
        email=value;
      },
    );
  }

  Widget buildPasswordField() {
    return TextFormField(
      obscureText: true,
      obscuringCharacter: ".",
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "password",
        prefixIcon: Icon(Icons.lock),
        border:OutlineInputBorder()
      ),
      validator: validatePassword,
        onSaved: (value) {
          password = value;
        },
    );
  }

  Widget buildGenderField() {
    return DropdownButtonFormField<String>(
      items: [
        DropdownMenuItem(
          child: Text("Female"),
          value: "Female",
        ),
        DropdownMenuItem(
          child: Text("Male"),
          value: "Male",
        ),
        DropdownMenuItem(
          child: Text("I don't wish to answer"),
          value: "I don't wish to answer",
        ),
      ],
      onChanged: (val) {
        gender = val;
        print("Gender $val");
      },
      decoration: InputDecoration(
        labelText: "Select your gender",
        hintText: "male",
        border: OutlineInputBorder(),
      ),
      validator: validateGender,
        onSaved: (value) {
          gender = value;
        },
    );
  }

  Widget buildSubmitButton(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text("Submit"),
        onPressed: () {
//access the form and try to validate each of children
//           bool? validForm =formKey.currentState?.validate();
//           if(validForm== true){
//             // attempt to extract all the values from formField.
//           }
//
          bool validForm =formKey.currentState!.validate();
       if(validForm){
         // attempt to extract all the values from formField.

       formKey.currentState!.save();
       print("Email is $email, Password is $password and Gender is $gender");
       Navigator.of(context).push(
           MaterialPageRoute(
             builder: (BuildContext context){
               return SecondScreen();
             },
           ),
       );
       }
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          padding: EdgeInsets.all(12),
        ),
      ),
    );
  }
}
