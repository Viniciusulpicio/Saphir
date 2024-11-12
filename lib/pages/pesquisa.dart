import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saphir/components/nav_bar.dart';
import 'package:saphir/shared/style.dart';

class GameListScreen extends StatefulWidget {
  @override
  _GameListScreenState createState() => _GameListScreenState();
}

class _GameListScreenState extends State<GameListScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<dynamic> games = [];
  List<dynamic> filteredGames = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadGames();
  }

  // Carregar o JSON do arquivo
  _loadGames() async {
    final String response = await rootBundle.loadString('assets/data/games.json');
    final List<dynamic> gameData = json.decode(response);
    setState(() {
      games = gameData;
      filteredGames = games; // Inicializa com todos os jogos
    });
  }

  // Função de pesquisa
  void _filterGames(String query) {
    final filtered = games.where((game) {
      final title = game['title'].toLowerCase();
      final searchQuery = query.toLowerCase();
      return title.contains(searchQuery); // Filtra os jogos pelo título
    }).toList();

    setState(() {
      filteredGames = filtered; // Atualiza a lista de jogos filtrados
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 0, 8, 2), // Fundo preto por trás do gradiente
        ),
        GradientBackground(
          child: Scaffold(
            backgroundColor: Colors.transparent, // Torna o fundo transparente para o gradiente aparecer
            appBar: null, // Remover a AppBar
            body: Center( // Centraliza o conteúdo
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Centraliza o conteúdo na vertical
                crossAxisAlignment: CrossAxisAlignment.center, // Centraliza o conteúdo na horizontal
                children: [
                  // Barra de pesquisa com altura bem reduzida
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 45.0).copyWith(top: 20.0),
  child: Container(
    height: 40, // Definir uma altura fixa para o container
    decoration: BoxDecoration(
      color: Colors.grey[300], // Cinza claro
      borderRadius: BorderRadius.circular(15), // Bordas arredondadas
      border: Border.all(color: Colors.grey[600]!), // Borda cinza mais escura
    ),
    padding: const EdgeInsets.symmetric(horizontal: 8.0), // Remover o padding vertical para reduzir altura
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center, // Centraliza os itens na horizontal
      children: [
        ClipRRect( // Usando ClipRRect para bordas arredondadas
          borderRadius: BorderRadius.circular(10), // Bordas arredondadas
          child: Image.asset(
            'assets/image/barra_pesquisa/logo_preto&branco.png',
            width: 30, // Tamanho ajustado para ficar ainda mais fino
            height: 30, // Tamanho ajustado para ficar mais fino
            fit: BoxFit.cover, // A imagem ocupa o espaço inteiro
          ),
        ),
        const SizedBox(width: 6), // Reduzir o espaçamento entre a imagem e o texto
        Expanded(
          child: TextField(
            controller: searchController,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Pesquise...',
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none, // Remove a borda interna do TextField
              contentPadding: EdgeInsets.symmetric(vertical: 9.0, horizontal: 8.0), // Ajuste de padding
            ),
            style: const TextStyle(
              color: Color.fromARGB(255, 110, 110, 110), // Cor do texto digitado (cinza)
              fontFamily: 'DaysOne',
            ),
            textAlignVertical: TextAlignVertical.center, // Alinha verticalmente o texto
            onChanged: (query) {
              _filterGames(query); // Filtra os jogos sempre que o texto mudar
            },
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, color: Color.fromARGB(255, 60, 60, 60), size: 24), // Ícone de pesquisa menor
        ),
      ],
    ),
  ),
),





                  const SizedBox(height: 20), // Espaço entre a barra de pesquisa e a lista

                  // Lista de jogos
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredGames.length,
                      itemBuilder: (context, index) {
                        final game = filteredGames[index];
                        return ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 40.0),
                          leading: ClipRRect( // Usando ClipRRect para bordas arredondadas
                            borderRadius: BorderRadius.circular(15), // Arredonda as bordas, sem ser oval
                            child: Image.asset(
                              game['image'],
                              width: 60, // Aumentando o tamanho da imagem
                              height: 60, // Aumentando o tamanho da imagem
                              fit: BoxFit.cover, // A imagem ocupa o espaço inteiro
                            ),
                          ),
                          title: Text(
                            game['title'],
                            style: const TextStyle(color: Colors.white), // Título em branco
                          ),
                          subtitle: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              const SizedBox(width: 4), // Espaçamento entre o ícone e o texto
                              Text(
                                game['rating'],
                                style: const TextStyle(color: Colors.white), // Subtítulo em branco
                              ),
                            ],
                          ),

                          onTap: () {
                            // Passando o ID do jogo como argumento para a próxima tela
                            Navigator.pushNamed(
                              context,
                              '/gameScreen',
                              arguments: game['id'], // Aqui você pega o 'id' do jogo
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: navBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ],
    );
  }
}
