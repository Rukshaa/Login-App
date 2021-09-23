class ValidationMixin {
  String? validateEmail (String? value){
  if(value!.contains("@") && value.contains(".")){
  return null;
  }
  return "Invalid email address";
  }

 String? validatePassword (String? value){
  if(value!.length>4){
  return null;
  }
  return "Password must be at least 5 characters long";
  }

  String? validateGender (String? value){
  if(value!=null){
  return null;
  }
  return "Please select your gender";
  }
}
