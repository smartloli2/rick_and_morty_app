import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/log/i_log.dart';
import 'package:rick_and_morty_app/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/character_details/presentation/character_details_screen.dart';
import 'package:sizer/sizer.dart';

import 'character_tile_widget.dart';

class CharacterHorizontalListWidget extends StatelessWidget {
  final List<Character> characters;

  const CharacterHorizontalListWidget({
    required this.characters,
  });

  @override
  Widget build(BuildContext context) {
    log.debug('Characters: ${characters.length}');

    return SizedBox(
      height: 30.0.h,
      width: double.infinity,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: characters.length,
          itemBuilder: (context, index) {
            return CharacterTileWidget(
              character: characters[index],
              onTap: () {
                Navigator.of(context).pushNamed(
                  CharacterDetailScreen.routeName,
                  arguments:
                      CharacterDetailsArguments(character: characters[index]),
                );
              },
            );
            // PopupMenuContainer(
            //   items: const [
            //     PopupMenuItem(value: 'delete', child: Text('Delete'))
            //   ],
            //   onItemSelected: (value) {
            //     if (value == 'delete') {

            //       context
            //           .read<>()
            //           .deleteItem(characters[index]));
            //     }
            //   },
            // child:
            // );
          }),
    );
  }
}
