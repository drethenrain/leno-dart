import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';
import 'package:leno/leno.dart';


void main() async {

  final commands = CommandsPlugin(prefix: mentionOr((_) => '!'));
  commands.addCommand(ping);

  final client = await Nyxx.connectGateway(
    env['TOKEN']!,
    GatewayIntents.allUnprivileged,
    options: GatewayClientOptions(plugins: [logging, cliIntegration, commands, ignoreExceptions,]),
  );

  final botUser = await client.users.fetchCurrentUser();

  client.onMessageCreate.listen((event) async {
    if (event.mentions.contains(botUser)) {
      await event.message.channel.sendMessage(MessageBuilder(
        content: 'faz o l',
        replyId: event.message.id,
      ));
    }
  });
}