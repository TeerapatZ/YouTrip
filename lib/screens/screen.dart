import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:youtrip/Action_Buttons/ActionBar.dart';
import 'package:youtrip/Menu/Special.dart';
import 'package:youtrip/screens/balance.dart';
import 'package:youtrip/Menu/menu.dart';
import 'package:youtrip/screens/sub_screen/Invite.dart';
import 'package:youtrip/screens/transaction.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _menuAnimation;
  bool _isMenuOpen = false;
  bool _isScrolled = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _menuAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), 
      end: const Offset(0.0, 0.0),   
    ).animate(_controller);

    // Add scroll listener to hide or show the purple box
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse && !_isScrolled) {
        setState(() {
          _isScrolled = true;
        });
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward && _isScrolled) {
        setState(() {
          _isScrolled = false;
        });
      }
    });
  }

  void _toggleMenu() {
    setState(() {
      if (_isMenuOpen) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
      _isMenuOpen = !_isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 109, 55, 166),
      body: Stack(
        children: [
          MenuDrawer(menuAnimation: _menuAnimation),
          
          Positioned.fill(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              transform: Matrix4.translationValues(_isMenuOpen ? 200 : 0, _isMenuOpen ? 150 : 0, 0)
                ..scale(_isMenuOpen ? 0.8 : 1.0), 
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 240, 240, 240),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Stack(
                  children: [
                    // Top fixed purple container
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 150,
                        padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 109, 55, 166),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.menu, color: Colors.white, size: 30),
                              onPressed: _toggleMenu,
                            ),
                            Image.asset(
                              'assets/images/youT.png',
                              width: 100,
                              height: 50,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                    // Action buttons Container positioned below the purple container
                    const ActionBar(),
                    // Scrollable content
                    Positioned.fill(
                      top: 220,
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            const BalanceSection(),
                            const SizedBox(height: 20),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 109, 55, 166),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: GestureDetector( // Use GestureDetector to handle the tap event
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SpecialScreen(), // Navigate to SpecialScreen
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'assets/images/33.png',
                                    width: double.infinity,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const TransactionSection(),
                          ],
                        ),
                      ),
                    ),
                    // Smaller Purple box with "ชวนเพื่อน รับ THB 100" at bottom-right
                    if (!_isScrolled)
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InviteScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 109, 55, 166),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.card_giftcard, color: Colors.white, size: 20),
                                SizedBox(width: 5),
                                Text(
                                  'ชวนเพื่อน รับ THB 100',
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                                SizedBox(width: 5),
                                Icon(Icons.chevron_right, color: Colors.white, size: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
