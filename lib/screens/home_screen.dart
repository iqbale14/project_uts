import 'package:flutter/material.dart';

// ============================================================
// POINT 2 & 3: Widget, Row, Column, Stack, Container
// ============================================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header dengan Stack
            _buildHeader(context),

            const Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Text(
                'Data Mahasiswa UBS',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
            ),

            // Demo Container Widget
            _buildContainerDemo(),

            // Demo Row Widget
            _buildRowDemo(),

            // Demo Column Widget
            _buildColumnDemo(),

            // Demo Stack Widget
            _buildStackDemo(),

            // Navigasi ke detail screens
            _buildNavigationButtons(context),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // HEADER dengan Stack Widget
  // ============================================================
  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        // Background layer
        Container(
          height: 220,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF6C63FF), Color(0xFF3F3D56)],
            ),
          ),
        ),
        // Decorative circles
        Positioned(
          right: -30,
          top: -30,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
        ),
        Positioned(
          left: -20,
          bottom: 0,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.07),
            ),
          ),
        ),
        // Content layer (Stack: text di atas background)
        Positioned.fill(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white24,
                        child: Icon(Icons.person, color: Colors.white, size: 28),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Selamat Datang!',
                            style: TextStyle(color: Colors.white70, fontSize: 13),
                          ),
                          Text(
                            'Iqbal Laksamana',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_outlined,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.school, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        Text(
                          ' Data Mahasiswa',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // DEMO: Container Widget
  // ============================================================
  Widget _buildContainerDemo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _DemoLabel('Tahun Masuk dan Prodi'),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6C63FF), Color(0xFF9C95FF)],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6C63FF).withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2023 dan Teknik Informatika',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // DEMO: Row Widget
  // ============================================================
  Widget _buildRowDemo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _DemoLabel('Total Matakuliah l IPK l Semester l SKS'),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _StatCard('12', 'Mata\nKuliah', const Color(0xFF6C63FF)),
                  _StatCard('3.75', 'IPK', const Color(0xFF43C6AC)),
                  _StatCard('6', 'Semester', const Color(0xFFFF6584)),
                  _StatCard('120', 'SKS', const Color(0xFFFFBE0B)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // DEMO: Column Widget
  // ============================================================
  Widget _buildColumnDemo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _DemoLabel('Persentasi Nilai Mata Kuliah'),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  _ProgressItem('Algoritma Pemrograman', 0.9, const Color(0xFF6C63FF)),
                  const SizedBox(height: 8),
                  _ProgressItem('Pemrograman Mobile', 0.85, const Color(0xFF43C6AC)),
                  const SizedBox(height: 8),
                  _ProgressItem('Basis Data', 0.75, const Color(0xFFFF6584)),
                  const SizedBox(height: 8),
                  _ProgressItem('Jaringan Komputer', 0.7, const Color(0xFFFFBE0B)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // DEMO: Stack Widget
  // ============================================================
  Widget _buildStackDemo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _DemoLabel('Pembayaran UKT'),
          SizedBox(
            height: 120,
            child: Stack(
              children: [
                // Background card
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF3F3D56),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                // Decorative circle 1
                Positioned(
                  right: 20,
                  top: 10,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF6C63FF).withOpacity(0.5),
                    ),
                  ),
                ),
                // Decorative circle 2
                Positioned(
                  right: 50,
                  top: 30,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFFF6584).withOpacity(0.5),
                    ),
                  ),
                ),
                // Text content on top
                const Positioned(
                  left: 20,
                  top: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Semester 6',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Pembayaran UKT 4.000.000',
                        style: TextStyle(color: Colors.white60, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                // Badge
                Positioned(
                  bottom: 12,
                  left: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6C63FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Tagihan Lunas',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Navigation Buttons
  // ============================================================
  Widget _buildNavigationButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _DemoLabel('Detail Aplikasi'),
          Row(
            children: [
              Expanded(
                child: _NavButton(
                  'Detail Widget',
                  Icons.widgets,
                  const Color(0xFF6C63FF),
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const WidgetDetailScreen(),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _NavButton(
                  'About App',
                  Icons.info_outline,
                  const Color(0xFF43C6AC),
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AboutScreen(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================================
// Reusable Widgets
// ============================================================
class _DemoLabel extends StatelessWidget {
  final String text;
  const _DemoLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 16,
            decoration: BoxDecoration(
              color: const Color(0xFF6C63FF),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF555555),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const _StatCard(this.value, this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 11, color: Colors.grey),
        ),
      ],
    );
  }
}

class _ProgressItem extends StatelessWidget {
  final String label;
  final double value;
  final Color color;

  const _ProgressItem(this.label, this.value, this.color);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(label, style: const TextStyle(fontSize: 12)),
        ),
        Expanded(
          flex: 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: value,
              backgroundColor: Colors.grey.shade200,
              color: color,
              minHeight: 8,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '${(value * 100).toInt()}%',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _NavButton(this.label, this.icon, this.color, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

// ============================================================
// POINT 4: Stack Navigation Screen (push dari HomeScreen)
// ============================================================
class WidgetDetailScreen extends StatelessWidget {
  const WidgetDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Widget Flutter'),
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _WidgetInfoCard(
            'Container',
            'Widget dasar untuk membungkus widget lain dengan kemampuan styling seperti padding, margin, warna, dan dekorasi.',
            Icons.crop_square,
            Color(0xFF6C63FF),
          ),
          _WidgetInfoCard(
            'Row',
            'Menyusun widget secara horizontal (kiri ke kanan). Mendukung MainAxisAlignment dan CrossAxisAlignment.',
            Icons.table_rows,
            Color(0xFF43C6AC),
          ),
          _WidgetInfoCard(
            'Column',
            'Menyusun widget secara vertikal (atas ke bawah). Cocok untuk layout form dan list.',
            Icons.view_column,
            Color(0xFFFF6584),
          ),
          _WidgetInfoCard(
            'Stack',
            'Menumpuk widget satu di atas yang lain. Menggunakan Positioned untuk mengatur posisi.',
            Icons.layers,
            Color(0xFFFFBE0B),
          ),
        ],
      ),
    );
  }
}

class _WidgetInfoCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const _WidgetInfoCard(this.title, this.description, this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// About Screen
// ============================================================
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
        backgroundColor: const Color(0xFF43C6AC),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF6C63FF).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.flutter_dash,
                  size: 80,
                  color: Color(0xFF6C63FF),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Flutter UTS Project',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Versi 1.0.0',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              const Text(
                'Proyek ini dibuat untuk memenuhi checklist UTS:\n'
                '✅ Inisiasi project Flutter\n'
                '✅ Widget dasar Flutter\n'
                '✅ Widget Layout (Row, Column, Stack, Container)\n'
                '✅ Navigasi (Stack, Bottom, Tab)\n'
                '✅ ListView data statis\n'
                '✅ Widget Form / Input Data',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, height: 1.8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
