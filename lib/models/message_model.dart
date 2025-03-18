class Message
{
  final String messageContent;
  final String id;

  Message(this.messageContent, this.id);
  factory Message.fromJason(jsonData)
  {
    return Message(jsonData['content'] ?? "رسالة غير متوفرة",jsonData['id']);
  }

}