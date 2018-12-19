import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', name: 'Gg'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.name});

  final String title;
  final String name;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //Map<String, dynamic> userCom = {"name": "John Smith", "email": "john@example.com"};
    
    // Put [] and then {"name": "John Smith", "email": "john@example.com"}
    //var user = json.decode('[{"name": "John Smith", "email": "john@example.com"}]');
    //Map<String, dynamic> user = json.decode('{"name": "John Smith", "email": "john@example.com"}');
    User myFirstUser = new User("John Smith", "johny@example.co.uk");
    User mySecUser = new User("Alfred Carman", "carman@example.co.uk");

    // Now I want to make an User array
    List<User> users = new List();
    users.add(myFirstUser);
    users.add(mySecUser);
    String usersJson = json.encode(users);

    //String myJson = json.encode(myFirstUser);
    //Map<String, dynamic> user = json.decode(myJson);
    var user = json.decode(usersJson);
    String asd = json.encode(user[1]); // I need to encode and then ... ->
    var perr = json.decode(asd); // -> Decode

    /**
     * Esto funciona así: yo genero una lista de usuarios y después la codifico a
     * JSON. Una vez codificada, decodifico la lista de usuarios.
     * 
     * Al decodificar la lista de usuarios, para podes acceder a los datos
     * de un usuario en particular necesiot conocer su index, su orden, ubicación,
     * que tenía en la lista anterior.
     * 
     * Una vez que conozco su index ahora necesito codificar el usuario otra vez,
     * y después lo decodifico otra vez para acceder a los datos que necesito.
     * así:
     * json.decode(json.encode(user[1]))['name']
     * 
     * Pero creo que lo mejor sería trabajar directamente con una lista de usuarios
     * en vez del propio json.
     * 
     * Una vez que se agregan nuevos datos, la lista se codificaría otra vez para generar
     * la persitencia de datos y cuando el cliente tenga conexión a internet, subir esos
     * datos.
     * 
     * Por lo que se debería crear un archivo que se llame "pendiente a subir" y se borre
     * cuando se sube con éxito el archivo a la base de datos.
     * 
     * Después otro archivo para tener ciertos datos de manera offline.
     * 
     * Hay que decidir qué datos se requieren para uso offline.
     */

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Text(
          //widget.name + " " + "Howdy," + " " + "${user['name']}" + "\n" + "We sent the verification link to ${user['email']}.",
          //widget.name + " " + "Howdy," + " " + "${perr['name']}" + "\n" + "We sent the verification link to ${user[1]}.",
          widget.name + " " + "Howdy," + " " + "${json.decode(json.encode(user[1]))['name']}" + "\n" + "We sent the verification link to ${user[1]}.",
          style: Theme.of(context).textTheme.display1,
        ));
  }
}

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() =>
    {
      'name': name,
      'email': email,
    };
}
