// import 'package:bottom_navy_bar/bottom_navy_bar.dart';
// import 'package:flutter/material.dart';

// import '../screens/pages/add_image.dart';
// import '../screens/pages/favorate.dart';
// import '../screens/pages/feed.dart';
// import '../screens/pages/profile_screen.dart';
// import '../screens/pages/search.dart';

// class BottomNav extends StatefulWidget {
//   const BottomNav({super.key});

//   @override
//   State<BottomNav> createState() => _BottomNavState();
// }

// class _BottomNavState extends State<BottomNav> {
//   static const red = Color(0xFFD94335);

//   int _currentIndex = 0;
//   late PageController _pageController;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   void _onItemSelected(int index) {
//     setState(() => _currentIndex = index);
//     _pageController.jumpToPage(index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (index) => setState(() => _currentIndex = index),
//         children: const [
//           Feed(),
//           Search(),
//           AddImage(),
//           Favorite(),
//           Profile(),
//         ],
//       ),
//       bottomNavigationBar: BottomNavyBar(
//         selectedIndex: _currentIndex,
//         showElevation: true,
//         itemCornerRadius: 8,
//         curve: Curves.easeInBack,
//         onItemSelected: _onItemSelected,
//         items: [
//           BottomNavyBarItem(
//             icon: const Icon(Icons.home),
//             title: const Text(
//               'Home',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 25, fontFamily: 'Billabong'),
//             ),
//             activeColor: red,
//             inactiveColor: Colors.black,
//           ),
//           BottomNavyBarItem(
//             icon: const Icon(Icons.search),
//             title: const Text(
//               'Search',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 25, fontFamily: 'Billabong'),
//             ),
//             activeColor: red,
//             inactiveColor: Colors.black,
//           ),
//           BottomNavyBarItem(
//             icon: const Icon(Icons.add_box_outlined),
//             title: const Text(
//               'Add',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 25, fontFamily: 'Billabong'),
//             ),
//             activeColor: red,
//             inactiveColor: Colors.black,
//           ),
//           BottomNavyBarItem(
//             icon: const Icon(Icons.favorite_border),
//             title: const Text(
//               'Fav',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 25, fontFamily: 'Billabong'),
//             ),
//             activeColor: red,
//             inactiveColor: Colors.black,
//           ),
//           BottomNavyBarItem(
//             icon: const Icon(Icons.person_outline),
//             title: const Text(
//               'Me',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 25, fontFamily: 'Billabong'),
//             ),
//             activeColor: red,
//             inactiveColor: Colors.black,
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:bottom_navy_bar/bottom_navy_bar.dart';

// import '../screens/pages/feed.dart';
// import '../screens/pages/search.dart';
// import '../screens/pages/add_image.dart';
// import '../screens/pages/favorate.dart';
// import '../screens/pages/profile_screen.dart';

// class BottomNav extends StatefulWidget {
//   const BottomNav({super.key});

//   @override
//   State<BottomNav> createState() => _BottomNavState();
// }

// class _BottomNavState extends State<BottomNav> {
//   int _currentIndex = 0;
//   late final PageController _pageController;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   void _onItemSelected(int index) {
//     setState(() => _currentIndex = index);
//     _pageController.jumpToPage(index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         physics: const NeverScrollableScrollPhysics(),
//         children: const [
//           Feed(),
//           Search(),
//           AddImage(),
//           Favorate(),
//           ProfileScreen(),
//         ],
//       ),
//       bottomNavigationBar: BottomNavyBar(
//         selectedIndex: _currentIndex,
//         showElevation: true,
//         itemCornerRadius: 8,
//         curve: Curves.easeInBack,
//         onItemSelected: _onItemSelected,

//         // ❌ PAS de "const" ici (sinon Not a constant expression)
//         items: [
//           BottomNavyBarItem(
//             icon: const Icon(Icons.home),
//             title: const Text(
//               'Home',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 25,
//                 fontFamily: 'Billabong',
//               ),
//             ),
//             activeColor: Colors.red,
//             inactiveColor: Colors.black,
//           ),
//           BottomNavyBarItem(
//             icon: const Icon(Icons.search),
//             title: const Text(
//               'Search',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 25,
//                 fontFamily: 'Billabong',
//               ),
//             ),
//             activeColor: Colors.red,
//             inactiveColor: Colors.black,
//           ),
//           BottomNavyBarItem(
//             icon: const Icon(Icons.add_box_outlined),
//             title: const Text(
//               'Add',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 25,
//                 fontFamily: 'Billabong',
//               ),
//             ),
//             activeColor: Colors.red,
//             inactiveColor: Colors.black,
//           ),
//           BottomNavyBarItem(
//             icon: const Icon(Icons.favorite_border),
//             title: const Text(
//               'Favorate',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 25,
//                 fontFamily: 'Billabong',
//               ),
//             ),
//             activeColor: Colors.red,
//             inactiveColor: Colors.black,
//           ),
//           BottomNavyBarItem(
//             icon: const Icon(Icons.person_outline),
//             title: const Text(
//               'Profile',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 25,
//                 fontFamily: 'Billabong',
//               ),
//             ),
//             activeColor: Colors.red,
//             inactiveColor: Colors.black,
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

import '../screens/pages/add_image.dart';
import '../screens/pages/favorate.dart';
import '../screens/pages/feed.dart';
import '../screens/pages/profile_screen.dart';
import '../screens/pages/search.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  late PageController _pageController;

  static const Color red = Color(0xFFE57373);

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemSelected(int index) {
    setState(() => _currentIndex = index);
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        // children: const [
        //   Feed(),
        //   Search(),
        //   AddImage(),
        //   Favorite(),
        //   Profile(),
        // ],
        // children: [
        //   const Feed(),
        //   const Search(),
        //   AddImage(key: UniqueKey()),
        //   const Favorite(),
        //   const Profile(),
        // ],
        children: [
          Feed(),
          Search(),
          AddImage(),
          Favorite(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 8,
        curve: Curves.easeInBack,
        onItemSelected: _onItemSelected,
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.home_outlined),
            title: const Text(
              'Home',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontFamily: 'Billabong'),
            ),
            activeColor: red,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.search),
            title: const Text(
              'Search',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontFamily: 'Billabong'),
            ),
            activeColor: red,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.add_box_outlined),
            title: const Text(
              'Add',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontFamily: 'Billabong'),
            ),
            activeColor: red,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.favorite_border),
            title: const Text(
              'Favorite',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontFamily: 'Billabong'),
            ),
            activeColor: red,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person_outline),
            title: const Text(
              'Me',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontFamily: 'Billabong'),
            ),
            activeColor: red,
            inactiveColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
