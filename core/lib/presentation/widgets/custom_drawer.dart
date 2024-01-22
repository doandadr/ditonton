import 'package:about/about.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  final Widget child;

  const CustomDrawer({super.key, required this.child});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  Widget _buildDrawer() {
    return Container(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/circle-g.png'),
            ),
            accountName: Text('Ditonton'),
            accountEmail: Text('ditonton@dicoding.com'),
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Movies'),
            onTap: () {
              Navigator.pushReplacementNamed(context, homeMoviePageRoute);
            },
          ), ListTile(
            leading: const Icon(Icons.tv),
            title: const Text('Tv Series'),
            onTap: () {
              Navigator.pushReplacementNamed(context, homeTvPageRoute);
            },
          ),
          ListTile(
            leading: const Icon(Icons.save_alt),
            title: const Text('Movies Watchlist'),
            onTap: () {
              Navigator.pushReplacementNamed(context, watchlistMoviesPageRoute);
            },
          ),
          ListTile(
            leading: const Icon(Icons.save_alt),
            title: const Text('Tv Series Watchlist'),
            onTap: () {
              Navigator.pushReplacementNamed(context, watchlistTvsPageRoute);
            },
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(context, aboutPageRoute);
            },
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
          ),
        ],
      ),
    );
  }

  void toggle() =>
      _animationController.isDismissed
          ? _animationController.forward()
          : _animationController.reverse();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggle,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          double slide = 255.0 * _animationController.value;
          double scale = 1 - (_animationController.value * 0.3);

          return Stack(
            children: [
              _buildDrawer(),
              Transform(
                  transform: Matrix4.identity()
                    ..translate(slide)
                    ..scale(scale),
                  alignment: Alignment.centerLeft,
                  child: widget.child),
            ],
          );
        },
      ),
    );
  }
}

