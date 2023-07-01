import 'package:flutter/material.dart';
import 'package:redlenshoescleaning/view/admin/pengeluaran/createpengeluaran.dart';
import 'package:redlenshoescleaning/view/admin/pengeluaran/pengeluaran.dart';
import 'package:redlenshoescleaning/view/admin/pengeluaran/updatepengeluaran.dart';
import 'package:redlenshoescleaning/view/admin/treatment/treatment.dart';
import 'package:redlenshoescleaning/view/laporanpage.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({Key? key}) : super(key: key);

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        return const LaporanPage();
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
        return const Pengeluaran();
      case 3:
        return const Treatment();
      default:
        return const Padding(
          padding: EdgeInsets.all(20),
          child: Text('Unknown Page'),
        );
    }
  }
}
