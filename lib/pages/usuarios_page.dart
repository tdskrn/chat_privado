import 'package:chat_privado/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../services/auth_services.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({super.key});

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final usuarios = [
    Usuario(online: true, nombre: 'Maria', email: 'maria@teste.com', uid: '1'),
    Usuario(
        online: false, nombre: 'Flavia', email: 'flavia@teste.com', uid: '2'),
    Usuario(
        online: true,
        nombre: 'Vinicius',
        email: 'vinicius@teste.com',
        uid: '3'),
  ];

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          authService.usuario.nombre,
          style: const TextStyle(
            color: Colors.black54,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'login');
            AuthService.deleteToken();
          },
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
      body: SmartRefresher(
        onRefresh: _cargarUsuarios,
        enablePullDown: true,
        header: WaterDropHeader(
          complete: Icon(
            Icons.check,
            color: Colors.blue[400],
          ),
          waterDropColor: Colors.blue[400]!,
        ),
        controller: _refreshController,
        child: _listViewUsuarios(),
      ),
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final user = usuarios[index];
          return _usuarioListTile(user);
        },
        separatorBuilder: (context, index) => const Divider(
              thickness: 2,
            ),
        itemCount: usuarios.length);
  }

  ListTile _usuarioListTile(Usuario user) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          setState(() {
            user.online = !user.online;
          });
        },
        child: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(user.nombre.substring(0, 2)),
        ),
      ),
      title: Text(user.nombre),
      subtitle: Text(user.email),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: user.online ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(100)),
      ),
    );
  }

  _cargarUsuarios() async {
    await Future.delayed(const Duration(milliseconds: 400));
    _refreshController.refreshCompleted();
  }
}
