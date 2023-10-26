import 'package:chat_privado/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({super.key});

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final usuarios = [
    Usuario(online: true, name: 'Maria', email: 'maria@teste.com', uid: '1'),
    Usuario(online: false, name: 'Flavia', email: 'flavia@teste.com', uid: '2'),
    Usuario(
        online: true, name: 'Vinicius', email: 'vinicius@teste.com', uid: '3'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Meu Nome',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.exit_to_app,
            color: Colors.black54,
          ),
        ),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10),
            // child: Icon(Icons.check_circle, color: Colors.blue[400],),
            child: const Icon(
              Icons.offline_bolt,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final user = usuarios[index];
            return ListTile(
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    user.isOnline = !user.online;
                  });
                },
                child: CircleAvatar(
                  child: Text(user.name.substring(0, 2)),
                ),
              ),
              title: Text(user.name),
              subtitle: Text(user.email),
              trailing: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: user.online ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(100)),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(
                thickness: 2,
              ),
          itemCount: usuarios.length),
    );
  }
}
