import 'package:film_gamed_app/features/app/presentation/manager/application_bloc.dart';
import 'package:film_gamed_app/features/app/presentation/manager/application_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).scaffoldBackgroundColor,
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Text(
                        'Movie App',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const SearchFieldDrawer(),
                  const SizedBox(height: 12),
                  MenuItem(
                    text: 'Movies',
                    icon: FeatherIcons.film,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 5),
                  MenuItem(
                    text: 'TVs',
                    icon: FeatherIcons.video,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 5),
                  MenuItem(
                    text: 'Watch List',
                    icon: Icons.bookmark,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 8),
                  const Divider(color: Colors.white70),
                  const SizedBox(height: 8),
                  MenuItem(
                    text: 'Settings',
                    icon: FeatherIcons.settings,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 5),
                  MenuItem(
                    text: 'About',
                    icon: FeatherIcons.info,
                    onClicked: () => selectedItem(context, 4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        BlocProvider.of<AppBloc>(context).add(
          ChangeAppScreenEvent(index: 0),
        );
        break;
      case 1:
        BlocProvider.of<AppBloc>(context).add(
          ChangeAppScreenEvent(index: 1),
        );
        break;
      case 2:
        BlocProvider.of<AppBloc>(context).add(
          ChangeAppScreenEvent(index: 2),
        );
        break;
      case 3:
        BlocProvider.of<AppBloc>(context).add(
          ChangeAppScreenEvent(index: 3),
        );
        break;
      case 4:
        BlocProvider.of<AppBloc>(context).add(
          ChangeAppScreenEvent(index: 4),
        );
        break;
    }
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onClicked;

  const MenuItem({
    required this.text,
    required this.icon,
    this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}

class SearchFieldDrawer extends StatelessWidget {
  const SearchFieldDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Colors.white;

    return TextField(
      style: const TextStyle(color: color, fontSize: 14),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        hintText: 'Search',
        hintStyle: const TextStyle(color: color),
        prefixIcon: const Icon(
          Icons.search,
          color: color,
          size: 20,
        ),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }
}
