import 'dart:convert';
import 'package:http/http.dart'as http;
class Api{
  Future<List<dynamic>>get ({required String url})async {
    http.Response response =await http.get(Uri.parse(url));
if(response.statusCode==200){
  return   jsonDecode(response.body);

}else{
  throw Exception('there is problem with this statusCode${response.statusCode}');
}

  }
  Future<Map<String ,dynamic>> post({required String url, Map<String,String>?body,String ?token})async{
    Map<String,String>headers={};
    if(token!=null){
      headers.addAll({'Authorization ':"Bearer$token"});
    }
    print('url${url}body${body}');
    http.Response response=await http.post(Uri.parse(url),body: body,headers: headers);
    if(response.statusCode==200) {
      Map<String, dynamic>data = jsonDecode(response.body);
      return data;
    }else{
      throw Exception('there is problem with statusCode${response.statusCode}${response.body}');
    }
    
  }
  Future<Map<String,dynamic>>put({required String url,Map<String,String>?body,String? token})async{
    Map<String,String>headers={};
    if(token!=null){
      headers.addAll({'Authorization':'Bearer$token'});
    }
    http.Response response=await http.put(Uri.parse(url),body: body,headers:headers );
    print('url${url},body${body}');
    if(response.statusCode==200){
      print(response.body);
      return jsonDecode(response.body);
    }
    else{
      throw Exception('there is a problem with statusCode ${response.statusCode}${response.body}');
    }
  }
}