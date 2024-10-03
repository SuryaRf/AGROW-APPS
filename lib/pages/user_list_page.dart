import 'package:flutter/material.dart';
import '../models/massege.dart'; // Assuming your Users model is here.
import 'chat_page.dart';

class UserListPage extends StatelessWidget {
  final List<Users> users = [
    Users(id: '1', name: 'Agus', lastMessage: 'Pesan terakhir dari Agus', lastMessageTime: '10:30 AM', avatarUrl: 'https://via.placeholder.com/150'),
    Users(id: '2', name: 'Hadi', lastMessage: 'Pesan terakhir dari Hadi', lastMessageTime: '09:15 AM', avatarUrl: 'https://via.placeholder.com/150'),
    Users(id: '3', name: 'Supriono', lastMessage: 'Pesan terakhir dari Supriono', lastMessageTime: '08:45 AM', avatarUrl: 'https://via.placeholder.com/150'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const  Text('Daftar Pesan')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(users[index].avatarUrl),
            ),
            title: Text(users[index].name),
            subtitle: Text(users[index].lastMessage),
            trailing: Text(users[index].lastMessageTime),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(user: users[index]), 
                ),
              );
            },
          );
        },
      ),
    );
  }
}
