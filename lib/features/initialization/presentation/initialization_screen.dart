import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/features/home/presentation/home_screen.dart';
import 'package:rick_and_morty_app/features/initialization/logic/initialization_state.dart';
import 'package:rick_and_morty_app/features/initialization/logic/initialization_store.dart';
import 'package:sizer/sizer.dart';
import 'package:rick_and_morty_app/core/constants/assets.dart';

class InitializationScreen extends StatefulWidget {
  const InitializationScreen({Key? key}) : super(key: key);

  @override
  _InitializationScreenState createState() => _InitializationScreenState();
}

class _InitializationScreenState extends State<InitializationScreen> {
  late final ReactionDisposer? disposer;

  @override
  void didChangeDependencies() {
    final store = context.read<InitializationStore>();
    disposer = when((_) => store.state is Initialized,
        () => Navigator.of(context).pushNamed(HomeScreen.routeName));

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    disposer?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        //color: Colors.red[200],
        width: 10.0.w,
        height: 5.0.h,

        child: SvgPicture.asset(
          IconsName.rick_and_morty_icon,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
