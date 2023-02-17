import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:toku/models/nubmer.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.color,
    required this.itemType,
    required this.item,
  }) : super(key: key);
  final Item item;
  final String itemType;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 100,
      child: Row(
        children: [
          Container(
            color: Color(0xffFFF6dc),
            child: Image.asset(item.image!),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.jpName,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  item.enName,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          Spacer(
            flex: 1,
          ),
          IconButton(
            onPressed: () {
              AssetsAudioPlayer.newPlayer().open(
                Audio(item.sound),
                autoStart: true,
                showNotification: true,
              );
            },
            icon: Icon(Icons.play_arrow),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class PhraseItem extends StatelessWidget {
  const PhraseItem({
    Key? key,
    required this.color,
    required this.itemType,
    required this.phrase,
  }) : super(key: key);
  final Item phrase;
  final String itemType;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 100,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  phrase.jpName,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  phrase.enName,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xffFFF6dc),
          ),
          Spacer(
            flex: 1,
          ),
          IconButton(
            onPressed: () {
              AssetsAudioPlayer.newPlayer().open(
                Audio(phrase.sound),
                autoStart: true,
                showNotification: true,
              );
            },
            icon: Icon(Icons.play_arrow),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
