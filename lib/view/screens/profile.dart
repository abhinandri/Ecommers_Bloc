import 'package:ecommers/view/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Profile',
          style: GoogleFonts.quicksand(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined,
                color: Colors.black87, size: 24),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Profile Header Section
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        'lib/assets/1edf8f80-c009-4e56-a492-a62d93615df6.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Abhinand',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'abhinandri864@gmail.com',
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            // Stats Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatColumn('Orders', '12'),
                  _buildStatColumn('Wishlist', '24'),
                  _buildStatColumn('Reviews', '8'),
                ],
              ),
            ),

            // Menu Items
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildMenuItem(
                    icon: Icons.shopping_bag_outlined,
                    title: 'My Orders',
                    subtitle: 'View your order history',
                  ),
                  _buildMenuItem(
                    icon: Icons.favorite_border,
                    title: 'Wishlist',
                    subtitle: 'Your favorite items',
                  ),
                  // _buildMenuItem(
                  //   icon: Icons.location_on_outlined,
                  //   title: 'Shipping Addresses',
                  //   subtitle: 'Manage delivery addresses',
                  // ),
                  _buildMenuItem(
                    icon: Icons.payment_outlined,
                    title: 'Payment Methods',
                    subtitle: 'Manage your payment options',
                  ),
                  _buildMenuItem(
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    subtitle: 'Manage your notifications',
                  ),
                  _buildMenuItem(
                    icon: Icons.help_outline,
                    title: 'Help Center',
                    subtitle: 'Get help and support',
                  ),
                ],
              ),
            ),

            // Logout Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () async {
                  bool confirmLogout = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        title: Text(
                          'Confirm Logout',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.logout_rounded,
                              size: 48,
                              color: Colors.black54,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Are you sure you want to log out?',
                              style: GoogleFonts.quicksand(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                            ),
                            child: Text(
                              'Cancel',
                              style: GoogleFonts.quicksand(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setBool('isLoggedIn', false);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                                (route) => false,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black87,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Logout',
                              style: GoogleFonts.quicksand(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                        actionsPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      );
                      // return AlertDialog(
                      //   title: Text('Confirm Logout'),
                      //   content: Text('Are you sure you want to log out?'),
                      //   actions: [
                      //     TextButton(onPressed: (){
                      //       Navigator.pop(context);
                      //     },
                      //      child: Text('cancel')),
                      //      TextButton(onPressed: ()async{
                      //       final prefs = await SharedPreferences.getInstance();
                      //       await prefs.setBool('isLoggedIn', false);

                      //       Navigator.pushAndRemoveUntil(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => LoginPage()),
                      //       (route) => false);
                      //      },
                      //       child:Text('Logout'))
                      //   ],

                      // );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Log Out',
                  style: GoogleFonts.quicksand(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: GoogleFonts.quicksand(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.black87, size: 24),
        ),
        title: Text(
          title,
          style: GoogleFonts.quicksand(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.quicksand(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.black54,
        ),
        onTap: () {},
      ),
    );
  }
}
