import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/widgets/null_widget.dart';
import 'package:rick_and_morty_app/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/character_details/presentation/character_details_screen.dart';
import 'package:sizer/sizer.dart';

class CharacterTileWidget extends StatelessWidget {
  final Character character;

  const CharacterTileWidget(this.character);

  @override
  Widget build(BuildContext context) {
    final cachedImage = character.cachedImage?.imageFile;

    if (cachedImage == null) return const NullWidget();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              CharacterDetailScreen.routeName,
              arguments: CharacterDetailsArguments(character: character),
            );
          },
          child: SizedBox(
            width: 45.0.w,
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black87,
                title: Text(
                  character.name,
                  textAlign: TextAlign.center,
                ),
              ),
              child: Image.file(
                cachedImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
