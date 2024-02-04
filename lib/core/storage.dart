import 'package:shared_preferences/shared_preferences.dart';

class Storage{
 

 loadUser() async {
  SharedPreferences storage=await SharedPreferences.getInstance();
  var id = storage.getInt("id");
  var name = storage.getString("name");
  var phone = storage.getString("phone");
  var email = storage.getString("email");

  if(id==null){
    return null;
  }else{
    return{"id": id, "name": name, "phone": phone, "email": email};
  }

 }


//Kullanıcıyı Kaydet
saveUser({
  required int id, 
  required String name, 
  required String email,
  required String phone,
  }) async{
    SharedPreferences storage = await SharedPreferences.getInstance();

    storage.setInt("id", id);
    storage.setString("name", name);
    storage.setString("email", email);
    storage.setString("phone", phone);


}
}