import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(debugShowCheckedModeBanner: false, home: FirstRoute()),
);

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Welcome to',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text('PRAKTIKUM PAB 2026', style: TextStyle(fontSize: 24)),
                SizedBox(height: 16),
                Text(
                  '1462300157',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/295/295128.png',
              width: 180,
            ),
            Column(
              children: [
                const Text(
                  'Farid Ihsan Falihuddin',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                _btn(
                  'Login',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const MainScreen()),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const MovieScreen(),
    const ProfileScreen(), // Profile screen yang udah dirombak
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1F5E5),
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1E232C),
        selectedItemColor: const Color(0xFF4EBE5F),
        unselectedItemColor: Colors.grey.shade400,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// --- HOME SCREEN ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 1.0,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
          );
        },
      ),
    );
  }
}

// --- MOVIE SCREEN ---
class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const Text(
          'My Bookings',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFD6F0E6),
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://images.unsplash.com/photo-1611892440504-42a792e24d32?auto=format&fit=crop&w=400&q=80',
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Villa 2 Room',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Status: Confirmed',
                      style: TextStyle(
                        color: Color(0xFF4EBE5F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 180,
            width: screenWidth,
            decoration: BoxDecoration(
              color: const Color(0xFFE3EFFF),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(screenWidth, 120),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            width: screenWidth,
            decoration: BoxDecoration(
              color: const Color(0xFFE3EFFF),
              borderRadius: BorderRadius.vertical(
                top: Radius.elliptical(screenWidth, 100),
              ),
            ),
          ),
        ),

        // Isi Konten Profile
        Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Profile',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            // Foto Profil (Lingkaran Putih dengan shadow)
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person_outline,
                  size: 50,
                  color: Colors.lightBlue,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // List Informasi User
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ListView(
                  children: [
                    const Divider(height: 1, thickness: 1),
                    _buildInfoRow(Icons.person_outline, 'PAB 2026'),
                    const Divider(height: 1, thickness: 1),
                    _buildInfoRow(Icons.phone_outlined, '1462300157'),
                    const Divider(height: 1, thickness: 1),
                    // Logo email udah ditambahkan di sini
                    _buildInfoRow(
                      Icons.email_outlined,
                      'fariddihsan@gmail.com',
                    ),
                    const Divider(height: 1, thickness: 1),
                    _buildInfoRow(Icons.location_on_outlined, 'Surabaya'),
                    const Divider(height: 1, thickness: 1),
                    _buildInfoRow(Icons.camera_alt_outlined, 'pab2026'),
                    const Divider(height: 1, thickness: 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData? icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.lightBlue, size: 28),
            const SizedBox(width: 20),
          ] else ...[
            const SizedBox(width: 48),
          ],
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class RoomDetailRoute extends StatelessWidget {
  final String n, img, desc;
  const RoomDetailRoute(this.n, this.img, this.desc, {super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFFE1F5E5),
    body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      n,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    img,
                    height: 280,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  top: 12,
                  left: 12,
                  child: Icon(Icons.star, color: Colors.amber, size: 45),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(24),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '\$100',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              desc,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: _btn(
              'Book Now',
              () => showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  title: const Text(
                    'Confirm Booking',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                    'Are you sure you want to book the $n for \$100 per night?',
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'OK',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              outline: true,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _btn(String txt, VoidCallback fn, {bool outline = false}) => SizedBox(
  width: double.infinity,
  height: 50,
  child: outline
      ? OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color(0xFFD6E4E5),
            side: const BorderSide(width: 1.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: fn,
          child: Text(
            txt,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        )
      : ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4EBE5F),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 0,
          ),
          onPressed: fn,
          child: Text(
            txt,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
);
