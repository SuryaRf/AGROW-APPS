class Users {
  final String id;
  final String name;
  final String lastMessage;
  final String lastMessageTime;
  final String avatarUrl;

  Users({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.avatarUrl,
  });
}


class Message {
  final String senderId;
  final String content;
  final DateTime timestamp;

  Message({required this.senderId, required this.content, required this.timestamp});
}
