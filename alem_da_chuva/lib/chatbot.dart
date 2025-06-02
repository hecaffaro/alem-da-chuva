import 'package:flutter/material.dart';

class ChatbotPage extends StatefulWidget {
   const ChatbotPage({super.key});

  @override
  ChatbotPageState createState() => ChatbotPageState();
}

class ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({"sender": "user", "text": text});
      _controller.clear();

      // Resposta automática do "bot"
      _messages.add({"sender": "bot", "text": "Desculpe, ainda estou em desenvolvimento e não consigo responder suas perguntas."});
    });
  }

  Widget _buildMessage(Map<String, String> message) {
    final isUser = message["sender"] == "user";
    final icon = isUser ? Icons.person : Icons.smart_toy;
    final bgColor = isUser ? Colors.blue[100] : Colors.grey[300];
    final radius = isUser
        ? BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          );

    return Row(
      mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isUser)
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 4),
            child: CircleAvatar(
              child: Icon(icon, size: 18),
            ),
          ),
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: radius,
            ),
            child: Text(message["text"] ?? ""),
          ),
        ),
        if (isUser)
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 4),
            child: CircleAvatar(
              child: Icon(icon, size: 18),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return _buildMessage(_messages[index]);
            },
          ),
        ),
        Divider(height: 1.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  onSubmitted: (_) => _sendMessage(),
                  decoration: InputDecoration.collapsed(
                    hintText: "Digite sua mensagem...",
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: _sendMessage,
              )
            ],
          ),
        ),
      ],
    );
  }
}
