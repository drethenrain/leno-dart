import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

ChatCommand ping = ChatCommand('ping', 'ping do bot fio', id('ping', (ChatContext context) async {

 final latency = context.client.httpHandler.latency;
    final formattedLatency =
        (latency.inMicroseconds / Duration.microsecondsPerMillisecond).toStringAsFixed(3);

    await context.respond(MessageBuilder(content: '${formattedLatency}ms'));

}));