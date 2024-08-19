import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: FadeTransition(
          opacity: _animation,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  // Navegar para "Meu Perfil"
                },
                child: CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
              SizedBox(width: 10),
              Text('Bom dia, usuária!'),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Lógica de logout
            },
          ),
        ],
      ),
      body: FadeTransition(
        opacity: _animation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Painel', style: Theme.of(context).textTheme.headline5),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  _buildCard('15%', 'Evasão'),
                  SizedBox(width: 16),
                  _buildCard('77%', 'Empregabilidade'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navegar para "Equipe"
                },
                child: Text('Acessar Equipe'),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Atualizações da Edu360°', style: Theme.of(context).textTheme.subtitle1),
            ),
            _buildCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'UC’s'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Estudantes'),
          BottomNavigationBarItem(icon: Icon(Icons.support), label: 'SAP'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Meu Perfil'),
        ],
      ),
    );
  }

  Widget _buildCard(String percentage, String title) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(percentage, style: Theme.of(context).textTheme.headline4),
              Text(title, style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        onPageChanged: (index, reason) {
          // Lógica de mudança de página
        },
      ),
      items: [1, 2].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    color: Colors.grey[300],
                    child: Center(child: Text('Banner $i')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Lorem Ipsum $i', style: Theme.of(context).textTheme.bodyText1),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
