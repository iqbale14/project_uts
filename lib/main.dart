import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UTS App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const MainNavigationScreen(),
    );
  }
}

// ============================================================
// POINT 4: Navigation - Bottom Navigation Tab
// ============================================================
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ListViewScreen(),
    const FormScreen(),
    const ProfileScreen(),
  ];

  final List<NavigationDestination> _destinations = const [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.list_outlined),
      selectedIcon: Icon(Icons.list),
      label: 'Daftar',
    ),
    NavigationDestination(
      icon: Icon(Icons.edit_outlined),
      selectedIcon: Icon(Icons.edit),
      label: 'Form',
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outlined),
      selectedIcon: Icon(Icons.person),
      label: 'Profil',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: _destinations,
        backgroundColor: Colors.white,
        elevation: 8,
        shadowColor: Colors.black26,
      ),
    );
  }
}

// ============================================================
// POINT 5: ListView Screen
// ============================================================
class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  final List<Map<String, dynamic>> _mahasiswaList = const [
    {
      'nama': 'Budi Santoso',
      'nim': '2021001',
      'prodi': 'Teknik Informatika',
      'ipk': '3.85',
      'icon': Icons.person,
      'color': Color(0xFF6C63FF),
    },
    {
      'nama': 'Siti Rahayu',
      'nim': '2021002',
      'prodi': 'Sistem Informasi',
      'ipk': '3.72',
      'icon': Icons.person,
      'color': Color(0xFFFF6584),
    },
    {
      'nama': 'Ahmad Fauzi',
      'nim': '2021003',
      'prodi': 'Teknik Komputer',
      'ipk': '3.91',
      'icon': Icons.person,
      'color': Color(0xFF43C6AC),
    },
    {
      'nama': 'Dewi Kusuma',
      'nim': '2021004',
      'prodi': 'Teknik Informatika',
      'ipk': '3.68',
      'icon': Icons.person,
      'color': Color(0xFFFFBE0B),
    },
    {
      'nama': 'Rizky Pratama',
      'nim': '2021005',
      'prodi': 'Sistem Informasi',
      'ipk': '3.55',
      'icon': Icons.person,
      'color': Color(0xFFFF6B6B),
    },
    {
      'nama': 'Nurul Hidayah',
      'nim': '2021006',
      'prodi': 'Teknik Informatika',
      'ipk': '3.78',
      'icon': Icons.person,
      'color': Color(0xFF4ECDC4),
    },
    {
      'nama': 'Dimas Aditya',
      'nim': '2021007',
      'prodi': 'Teknik Komputer',
      'ipk': '3.62',
      'icon': Icons.person,
      'color': Color(0xFFA78BFA),
    },
    {
      'nama': 'Fitri Handayani',
      'nim': '2021008',
      'prodi': 'Sistem Informasi',
      'ipk': '3.88',
      'icon': Icons.person,
      'color': Color(0xFFFB923C),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          'Daftar Mahasiswa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Header info
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: const Color(0xFF6C63FF),
            child: Text(
              'Total: ${_mahasiswaList.length} Mahasiswa',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ),
          // ListView
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _mahasiswaList.length,
              itemBuilder: (context, index) {
                final mahasiswa = _mahasiswaList[index];
                return _MahasiswaCard(mahasiswa: mahasiswa, index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MahasiswaCard extends StatelessWidget {
  final Map<String, dynamic> mahasiswa;
  final int index;

  const _MahasiswaCard({required this.mahasiswa, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: mahasiswa['color'],
          child: Text(
            mahasiswa['nama'][0],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          mahasiswa['nama'],
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NIM: ${mahasiswa['nim']}'),
            Text(mahasiswa['prodi'], style: const TextStyle(color: Colors.grey)),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: mahasiswa['color'],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'IPK\n${mahasiswa['ipk']}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text(mahasiswa['nama']),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('NIM: ${mahasiswa['nim']}'),
                  Text('Program Studi: ${mahasiswa['prodi']}'),
                  Text('IPK: ${mahasiswa['ipk']}'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Tutup'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
// --- TARUH DI SINI (PALING ATAS FILE) ---

class Mahasiswa {
  final String nama;
  final String nim;
  final String prodi;
  final String ipk;

  Mahasiswa({
    required this.nama, 
    required this.nim, 
    required this.prodi, 
    this.ipk = "4.0", // Nilai default
  });
}

// Inilah wadah penampung datanya
List<Mahasiswa> daftarMahasiswaGlobal = []; 


// ============================================================
// POINT 6: Form Screen (Widget Form / Input Data)
// ============================================================
class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _emailController = TextEditingController();
  final _teleponController = TextEditingController();
  String _selectedProdi = 'Teknik Informatika';
  String _selectedSemester = '1';
  bool _isAktif = true;

  final List<String> _prodiList = [
    'Teknik Informatika',
    'Sistem Informasi',
    'Teknik Komputer',
    'Teknologi Informasi',
  ];

  final List<String> _semesterList = ['1', '2', '3', '4', '5', '6', '7', '8'];

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _emailController.dispose();
    _teleponController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Row(
            children: [
              Icon(Icons.check_circle, color: Color(0xFF43C6AC)),
              SizedBox(width: 8),
              Text('Data Tersimpan!'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _InfoRow('Nama', _namaController.text),
              _InfoRow('NIM', _nimController.text),
              _InfoRow('Email', _emailController.text),
              _InfoRow('Telepon', _teleponController.text),
              _InfoRow('Prodi', _selectedProdi),
              _InfoRow('Semester', _selectedSemester),
              _InfoRow('Status', _isAktif ? 'Aktif' : 'Non-Aktif'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _resetForm();
              },
              child: const Text('Reset Form'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6C63FF),
                foregroundColor: Colors.white,
              ),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _namaController.clear();
    _nimController.clear();
    _emailController.clear();
    _teleponController.clear();
    setState(() {
      _selectedProdi = 'Teknik Informatika';
      _selectedSemester = '1';
      _isAktif = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          'Form Input Data',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Card
              Card(
                color: const Color(0xFF6C63FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.school, color: Colors.white, size: 32),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Registrasi Mahasiswa',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Lengkapi semua data dengan benar',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Form Fields
              _SectionTitle('Data Pribadi'),
              const SizedBox(height: 8),

              // Nama
              TextFormField(
                controller: _namaController,
                decoration: _inputDecoration('Nama Lengkap', Icons.person),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Nama tidak boleh kosong' : null,
              ),
              const SizedBox(height: 12),

              // NIM
              TextFormField(
                controller: _nimController,
                decoration: _inputDecoration('NIM', Icons.badge),
                keyboardType: TextInputType.number,
                validator: (val) {
                  if (val == null || val.isEmpty) return 'NIM tidak boleh kosong';
                  if (val.length < 7) return 'NIM minimal 7 digit';
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Email
              TextFormField(
                controller: _emailController,
                decoration: _inputDecoration('Email', Icons.email),
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Email tidak boleh kosong';
                  if (!val.contains('@')) return 'Format email tidak valid';
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Telepon
              TextFormField(
                controller: _teleponController,
                decoration: _inputDecoration('No. Telepon', Icons.phone),
                keyboardType: TextInputType.phone,
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Telepon tidak boleh kosong';
                  if (val.length < 10) return 'Nomor telepon tidak valid';
                  return null;
                },
              ),
              const SizedBox(height: 16),

              _SectionTitle('Data Akademik'),
              const SizedBox(height: 8),

              // Dropdown Prodi
              DropdownButtonFormField<String>(
                value: _selectedProdi,
                decoration: _inputDecoration('Program Studi', Icons.school),
                items: _prodiList
                    .map((prodi) => DropdownMenuItem(
                          value: prodi,
                          child: Text(prodi),
                        ))
                    .toList(),
                onChanged: (val) => setState(() => _selectedProdi = val!),
              ),
              const SizedBox(height: 12),

              // Dropdown Semester
              DropdownButtonFormField<String>(
                value: _selectedSemester,
                decoration: _inputDecoration('Semester', Icons.calendar_today),
                items: _semesterList
                    .map((sem) => DropdownMenuItem(
                          value: sem,
                          child: Text('Semester $sem'),
                        ))
                    .toList(),
                onChanged: (val) => setState(() => _selectedSemester = val!),
              ),
              const SizedBox(height: 12),

              // Switch Status Aktif
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.toggle_on, color: Color(0xFF6C63FF)),
                          SizedBox(width: 8),
                          Text('Status Aktif',
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      Switch(
                        value: _isAktif,
                        onChanged: (val) => setState(() => _isAktif = val),
                        activeColor: const Color(0xFF6C63FF),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _resetForm,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Reset'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: Color(0xFF6C63FF)),
                        foregroundColor: const Color(0xFF6C63FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton.icon(
                      onPressed: _submitForm,
                      icon: const Icon(Icons.save),
                      label: const Text('Simpan Data'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6C63FF),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: const Color(0xFF6C63FF)),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF6C63FF), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF6C63FF),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text('$label:', style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

// ============================================================
// Profile Screen (navigasi tambahan)
// ============================================================
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('Profil', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(32),
            color: const Color(0xFF6C63FF),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.person, size: 60, color: Colors.white),
                ),
                SizedBox(height: 12),
                Text(
                  'Iqbal Laksamana',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Mahasiswa Teknik Informatika',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _ProfileItem(Icons.badge, 'NIM', '2301111110068'),
          _ProfileItem(Icons.school, 'Program Studi', 'Teknik Informatika'),
          _ProfileItem(Icons.calendar_today, 'Semester', '6'),
          _ProfileItem(Icons.star, 'IPK', '3.75'),
          _ProfileItem(Icons.email, 'Email', 'iqbal@student.ac.id'),
        ],
      ),
    );
  }
}

class _ProfileItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ProfileItem(this.icon, this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF6C63FF)),
        title: Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
