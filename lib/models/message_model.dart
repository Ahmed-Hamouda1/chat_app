class Message
{
  final String messageContent;

  Message(this.messageContent);
  factory Message.fromJason(jsonData)
  {
    return Message(jsonData['content'] ?? "رسالة غير متوفرة");
  }

}