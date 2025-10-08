import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const ProfileImage(),
              const SizedBox(height: 14),
              const Text(
                'Arturo Espinosa',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Tlalpan, CDMX',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w200),
              ),
              const SizedBox(height: 35),
              const FavoritesCounter(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const ProfileTile(
                      title: 'Personal Information',
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 14),
                    const ProfileTile(
                      title: 'Your Order',
                      icon: Icons.shopping_cart,
                    ),
                    const SizedBox(height: 14),
                    const ProfileTile(
                      title: 'Your Favorites',
                      icon: Icons.favorite,
                    ),
                    const SizedBox(height: 14),
                    const ProfileTile(
                      title: 'Payment',
                      icon: Icons.wallet,
                    ),
                    const SizedBox(height: 14),
                    const ProfileTile(
                      title: 'Recommended Shops',
                      icon: Icons.store,
                    ),
                    const SizedBox(height: 14),
                    const ProfileTile(
                      title: 'Nearest shop',
                      icon: Icons.location_on,
                    ),
                    const SizedBox(height: 14),
                    ProfileTile(
                      title: 'Logout',
                      icon: Icons.logout_outlined,
                      iconColor: Colors.black.withValues(alpha: 0.4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    required this.title,
    required this.icon,
    super.key,
    this.iconColor = Colors.blue,
  });
  final String title;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 45,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class FavoritesCounter extends StatelessWidget {
  const FavoritesCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        3,
        (index) => SizedBox.square(
          dimension: 80,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Favoritos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '5',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 84,
          width: 84,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(300),
            color: Colors.blue,
          ),
        ),
        Positioned(
          top: 2,
          left: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(300),
            child: Image.asset(
              'assets/images/tab_bar_bg.jpg',
              fit: BoxFit.cover,
              height: 80,
              width: 80,
            ),
          ),
        ),
      ],
    );
  }
}
