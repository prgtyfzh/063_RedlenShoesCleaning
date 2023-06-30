import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redlenshoescleaning/view/admin/pengeluaran/createpengeluaran.dart';
import 'package:redlenshoescleaning/view/admin/pengeluaran/updatepengeluaran.dart';
import 'package:redlenshoescleaning/view/admin/treatment/createtreatment.dart';
import 'package:redlenshoescleaning/view/admin/treatment/updatetreatment.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({Key? key}) : super(key: key);

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  int _selectedIndex = 0;
  String appBarTitle = 'REDLEN APPS'; // Teks AppBar default

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      appBarTitle = _getAppBarTitle(
          index); // Mendapatkan teks AppBar yang sesuai dengan index
    });
  }

  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'REDLEN APPS';
      case 1:
        return 'Daftar Pendapatan';
      case 2:
        return 'Daftar Pengeluaran';
      case 3:
        return 'Daftar Treatment';
      default:
        return 'REDLEN APPS';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD9D9D9),
        centerTitle: true,
        title: Text(
          appBarTitle,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: _buildPage(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25.0)),
        child: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Color(0xFFD9D9D9),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.trending_up_sharp),
                label: 'Pendapatan',
                backgroundColor: Color(0xFFD9D9D9),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.trending_down_sharp),
                label: 'Pengeluaran',
                backgroundColor: Color(0xFFD9D9D9),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.analytics_sharp),
                label: 'Treatment',
                backgroundColor: Color(0xFFD9D9D9),
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: 350,
            height: 300,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pendapatan',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 85),
                      Text(
                        'Pengeluaran',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDecorationBox(Colors.white),
                      const SizedBox(width: 20),
                      _buildDecorationBox(Colors.white),
                    ],
                  ),
                  const SizedBox(height: 65),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Laba',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 140),
                      Text(
                        'Rugi',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDecorationBox(Colors.white),
                      const SizedBox(width: 20),
                      _buildDecorationBox(Colors.white),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      case 1:
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20.0),
                      child: InkWell(
                        onLongPress: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => UpdateContact(
                          //       id: data[index]['id'],
                          //       name: data[index]['name'],
                          //       phone: data[index]['phone'],
                          //       email: data[index]['email'],
                          //       address: data[index]['address'],
                          //     ),
                          //   ),
                          // );
                        },
                        child: const Card(
                          color: Color(0xFFD9D9D9),
                          elevation: 4,
                          child: ListTile(
                            title: Text('Tanggal'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sepatu'),
                                Text('Nama Treatment'),
                                Text('Harga'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );

      case 2:
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 20.0,
                      ),
                      child: Card(
                        color: const Color(0xFFD9D9D9),
                        elevation: 4,
                        child: ListTile(
                          title: const Text('Tanggal'),
                          subtitle: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nama Barang'),
                              Text('Harga'),
                            ],
                          ),
                          trailing: PopupMenuButton<String>(
                            icon: const Icon(
                              Icons.more_vert,
                              size: 25,
                            ),
                            onSelected: (value) {
                              if (value == 'edit') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const UpdatePengeluaran(
                                            // id: data[index]['id'],
                                            // name: data[index]['name'],
                                            // phone: data[index]['phone'],
                                            // email: data[index]['email'],
                                            // address: data[index]['address'],
                                            ),
                                  ),
                                );
                              } else if (value == 'delete') {
                                // Handle delete action
                                // ...
                              }
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 'edit',
                                child: Text('Edit'),
                              ),
                              const PopupMenuItem(
                                value: 'delete',
                                child: Text('Delete'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreatePengeluaran(),
                ),
              );
            },
            backgroundColor: const Color(0xFFD9D9D9),
            child: const Icon(Icons.add),
          ),
        );
      case 3:
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 20.0,
                      ),
                      child: InkWell(
                        onLongPress: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => UpdateContact(
                          //       id: data[index]['id'],
                          //       name: data[index]['name'],
                          //       phone: data[index]['phone'],
                          //       email: data[index]['email'],
                          //       address: data[index]['address'],
                          //     ),
                          //   ),
                          // );
                        },
                        child: Card(
                          color: const Color(0xFFD9D9D9),
                          elevation: 4,
                          child: ListTile(
                            title: const Text('Nama Treatment'),
                            subtitle: const Text('Harga'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const UpdateTreatment(),
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    // Handle delete button press
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateTreatment(),
                ),
              );
            },
            backgroundColor: const Color(0xFFD9D9D9),
            child: const Icon(Icons.add),
          ),
        );
      default:
        return const Padding(
          padding: EdgeInsets.all(20),
          child: Text('Unknown Page'),
        );
    }
  }

  Widget _buildDecorationBox(Color color) {
    return Container(
      width: 150,
      height: 35,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
