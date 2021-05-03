import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mjam/models_and_data/Class/HttpException.dart';

class Authentication with ChangeNotifier {
  Future<void> signUp(String email, String password) async {
    var url =Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=AIzaSyARnueivBPkDQJjwfNKWX4hA_LGsYgMQu4');
       try{final response = await http.post(url,
           body: json.encode({
             'email': email,
             'password': password,
             'returnSecureToken': true,
           }));
       final responseData = json.decode(response.body);
       print(responseData);
       if(responseData['error']!=null){
         throw HttpException(responseData['error']['message']);
       }
       }catch(error)
       {
         throw error;
       }

  }
}
