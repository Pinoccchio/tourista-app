import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../Database_Helper/static_users.dart';
import 'custom_card.dart';
import 'menu_item.dart'; // Corrected import for menu_item.dart

class Home extends StatefulWidget {
  final User user;

  const Home({required this.user}); // Marked as const for optimization

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _items = [
    'Design Inspiration',
    'Food Recipe',
    'UI Tips',
    'Tech News',
    'Flutter Guide',
    'Web Dev Trends',
  ];

  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _items; // Initialize filtered items
    _searchController.addListener(_filterItems);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems() {
    setState(() {
      _filteredItems = _items
          .where((item) => item.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 17),
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50), // Top padding
            _buildWelcomeText(),
            const SizedBox(height: 8), // Spacing
            _buildHeaderRow(),
            const SizedBox(height: 24), // Spacing before search bar
            _buildSearchBar(),
            const SizedBox(height: 24), // Spacing before menu
            _buildMenuTitle(),
            const SizedBox(height: 16), // Spacing before menu items
            _buildMenuItems(),
            const SizedBox(height: 32), // Spacing before transcriptions
            _buildTranscriptionsTitle(),
            const SizedBox(height: 10), // Spacing before the list of transcriptions
            _buildTranscriptionsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        'Welcome to EduHelix',
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          height: 1.3,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            widget.user.firstName,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: 32,
              height: 1.1,
              color: Colors.white,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigate to the profile page
            Navigator.pushNamed(context, '/profile');

            // Optional: You can keep the toast message if you want
            Fluttertoast.showToast(
              msg: "Icon is Clicked",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: const Color(0xFF73CBE6),
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
          child: SizedBox(
            width: 24,
            height: 24,
            child: Lottie.asset(
              'assets/animated_icon/wired-flat-268-avatar-man.json',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF171717),
        borderRadius: BorderRadius.circular(36),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 8),
            width: 18,
            height: 18,
            child: SvgPicture.asset('assets/vectors/vector_8_x2.svg'),
          ),
          Expanded(
            child: TextField(
              controller: _searchController,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xFF949494),
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 6),
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        'Menu',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          height: 1.3,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildMenuItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MenuItem(
          iconPath: 'assets/animated_icon/study-planner-animated.json',
          label: 'Study Planner',
        ),
        const SizedBox(width: 16),
        MenuItem(
          iconPath: 'assets/animated_icon/animated-microphone.json',
          label: 'Text-To-Speech',
        ),
      ],
    );
  }

  Widget _buildTranscriptionsTitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Transcriptions',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              height: 1.3,
              color: Colors.white,
            ),
          ),
          Text(
            'See all',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              height: 1.1,
              color: const Color(0xFF73CBE6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTranscriptionsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _filteredItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: CustomCard(
              title: _filteredItems[index],
              time: '00:${(index + 3) * 2}:00',
              words: '${(index + 1) * 400} Words',
              date: 'Feb ${(index + 10)}',
              profileIcon: 'assets/vectors/rectangle_4_x2.svg',
              menuIcon: 'assets/animated_icon/vertical-anim-icon.json',
            ),
          );
        },
      ),
    );
  }
}
