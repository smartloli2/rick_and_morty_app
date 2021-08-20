import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/widgets/null_widget.dart';
import 'package:rick_and_morty_app/domain/entities/character.dart';
import 'package:sizer/sizer.dart';

class CharacterTileWidget extends StatelessWidget {
  final Character character;
  final void Function()? onTap;
  final bool isCached;

  const CharacterTileWidget({
    required this.character,
    required this.onTap,
    this.isCached = true,
  });

  @override
  Widget build(BuildContext context) {
    final cachedImage = character.cachedImage?.imageFile;

    if (isCached && cachedImage == null) return const NullWidget();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: 30.0.h,
            width: 45.0.w,
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black87,
                title: Text(
                  character.name,
                  textAlign: TextAlign.center,
                ),
              ),
              child: isCached
                  ? Image.file(
                      cachedImage!,
                      fit: BoxFit.cover,
                    )
                  : Image.network(character.image),
            ),
          ),
        ),
      ),
    );
  }
}
