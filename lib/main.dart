import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const CineTripApp());

// ============ CORES ============
class AppColors {
  static const maroon = Color(0xFF5C1A2B);
  static const maroonDark = Color(0xFF3E0F1C);
  static const pink = Color(0xFFF6E3E8);
  static const pinkSoft = Color(0xFFFBF1F4);
  static const cream = Color(0xFFFDF9FA);
  static const textDark = Color(0xFF2B1B20);
  static const textMuted = Color(0xFF8A7379);
  static const gold = Color(0xFFC9A227);
}

// ============ MODELOS ============
class Ponto {
  final String titulo;
  final String descricao;
  final String horario;
  final LatLng local;
  const Ponto(this.titulo, this.descricao, this.horario, this.local);
}

class Pacote {
  final String filme;
  final String destino;
  final String pais;
  final String genero;
  final double nota;
  final String preco;
  final String duracao;
  final String imagem;
  final String sinopse;
  final List<String> incluso;
  final List<Ponto> roteiro;

  const Pacote({
    required this.filme,
    required this.destino,
    required this.pais,
    required this.genero,
    required this.nota,
    required this.preco,
    required this.duracao,
    required this.imagem,
    required this.sinopse,
    required this.incluso,
    required this.roteiro,
  });
}

// ============ DADOS ============
const generos = ['Romance', 'Comédia', 'Ação', 'Drama'];

final pacotes = <Pacote>[
  const Pacote(
    filme: 'Um Amor em Notting Hill',
    destino: 'Londres',
    pais: 'Reino Unido',
    genero: 'Romance',
    nota: 4.9,
    preco: 'R\$ 12.480',
    duracao: '7 dias / 6 noites',
    imagem:
        'https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=900',
    sinopse:
        'Percorra as ruas onde o clássico romance foi filmado: a Porta Azul, o mercado de Portobello Road e os jardins que marcaram a história.',
    incluso: [
      'Passagem aérea ida e volta',
      'Hospedagem em hotel boutique',
      'Tour guiado pelos cenários do filme',
      'Jantar temático incluso',
      'Mapas e roteiro digital',
    ],
    roteiro: [
      Ponto('Notting Hill (Porta Azul)',
          'A casa mais fotografada de Londres, cenário icônico do filme.',
          'Dia 1 - 09:00', LatLng(51.5165, -0.2010)),
      Ponto('Portobello Road Market',
          'Mercado de antiguidades onde o casal se encontra.',
          'Dia 1 - 14:00', LatLng(51.5170, -0.2055)),
      Ponto('Kensington Gardens',
          'Passeio pelos jardins que aparecem na reta final.',
          'Dia 2 - 10:00', LatLng(51.5073, -0.1657)),
      Ponto('Tower Bridge',
          'Vista panorâmica do Tamisa ao entardecer.',
          'Dia 3 - 17:30', LatLng(51.5055, -0.0754)),
    ],
  ),
  const Pacote(
    filme: 'Se Beber, Não Case',
    destino: 'Las Vegas',
    pais: 'Estados Unidos',
    genero: 'Comédia',
    nota: 4.7,
    preco: 'R\$ 9.890',
    duracao: '5 dias / 4 noites',
    imagem:
        'https://images.unsplash.com/photo-1605833556294-ea5c7a74f57d?w=900',
    sinopse:
        'Reviva a comédia mais caótica do cinema com um roteiro pelos cassinos, hotéis e pontos que marcaram a despedida de solteiro mais famosa.',
    incluso: [
      'Passagem aérea ida e volta',
      'Hospedagem no Strip',
      'City tour noturno',
      'Ingresso para show',
      'Mapas e roteiro digital',
    ],
    roteiro: [
      Ponto('Caesars Palace', 'O lendário hotel onde a trama começa.',
          'Dia 1 - 16:00', LatLng(36.1162, -115.1745)),
      Ponto('The Strip', 'Caminhada pela avenida mais iluminada do mundo.',
          'Dia 1 - 21:00', LatLng(36.1147, -115.1728)),
      Ponto('Bellagio Fountains', 'Show de águas que aparece no desfecho.',
          'Dia 2 - 20:00', LatLng(36.1126, -115.1767)),
    ],
  ),
  const Pacote(
    filme: 'Meia-Noite em Paris',
    destino: 'Paris',
    pais: 'França',
    genero: 'Romance',
    nota: 4.8,
    preco: 'R\$ 14.200',
    duracao: '8 dias / 7 noites',
    imagem:
        'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=900',
    sinopse:
        'Uma viagem atemporal pela capital francesa, entre bistrôs, boulevards e as escadarias eternizadas pelo filme.',
    incluso: [
      'Passagem aérea ida e volta',
      'Hospedagem central em Paris',
      'Tour literário guiado',
      'Degustação em bistrô',
      'Mapas e roteiro digital',
    ],
    roteiro: [
      Ponto('Escadaria de Montmartre',
          'Onde o protagonista é levado ao passado.', 'Dia 1 - 18:00',
          LatLng(48.8867, 2.3431)),
      Ponto('Pont Alexandre III',
          'Ponte mais elegante da cidade, cenário noturno.',
          'Dia 2 - 21:00', LatLng(48.8637, 2.3135)),
      Ponto('Musée Rodin', 'Jardim de esculturas que aparece no roteiro.',
          'Dia 3 - 11:00', LatLng(48.8553, 2.3158)),
    ],
  ),
  const Pacote(
    filme: 'Gladiador',
    destino: 'Roma',
    pais: 'Itália',
    genero: 'Ação',
    nota: 4.6,
    preco: 'R\$ 11.350',
    duracao: '6 dias / 5 noites',
    imagem:
        'https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=900',
    sinopse:
        'Caminhe pelas ruínas que deram vida à épica de Maximus, com visitas guiadas aos cenários históricos do filme.',
    incluso: [
      'Passagem aérea ida e volta',
      'Hospedagem no centro histórico',
      'Ingresso prioritário ao Coliseu',
      'Tour arqueológico guiado',
      'Mapas e roteiro digital',
    ],
    roteiro: [
      Ponto('Coliseu', 'A arena onde as batalhas foram encenadas.',
          'Dia 1 - 09:30', LatLng(41.8902, 12.4922)),
      Ponto('Fórum Romano', 'Ruínas centrais da Roma antiga.',
          'Dia 1 - 14:00', LatLng(41.8925, 12.4853)),
      Ponto('Villa Borghese', 'Jardins usados nas cenas de descanso.',
          'Dia 2 - 10:00', LatLng(41.9142, 12.4923)),
    ],
  ),
  const Pacote(
    filme: 'Encontros e Desencontros',
    destino: 'Tóquio',
    pais: 'Japão',
    genero: 'Drama',
    nota: 4.8,
    preco: 'R\$ 16.700',
    duracao: '9 dias / 8 noites',
    imagem:
        'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=900',
    sinopse:
        'Uma imersão no Japão contemporâneo, entre hotéis de luxo, karaokês e os cruzamentos mais movimentados do mundo.',
    incluso: [
      'Passagem aérea ida e volta',
      'Hospedagem com vista para a cidade',
      'JR Pass para 7 dias',
      'Experiência de karaokê',
      'Mapas e roteiro digital',
    ],
    roteiro: [
      Ponto('Shibuya Crossing',
          'O cruzamento mais famoso do cinema moderno.', 'Dia 1 - 19:00',
          LatLng(35.6595, 139.7005)),
      Ponto('Park Hyatt Tokyo',
          'Hotel onde grande parte da trama se passa.', 'Dia 2 - 17:00',
          LatLng(35.6852, 139.6907)),
      Ponto('Templo Senso-ji', 'Contraste entre tradição e metrópole.',
          'Dia 3 - 09:00', LatLng(35.7148, 139.7967)),
    ],
  ),
];

// ============ APP ============
class CineTripApp extends StatelessWidget {
  const CineTripApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineTrip',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.cream,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.maroon),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.cream,
          foregroundColor: AppColors.textDark,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const Splash(),
    );
  }
}

// ============ 1. SPLASH ============
class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=1200',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(color: AppColors.maroonDark),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.maroonDark.withValues(alpha: 0.35),
                  AppColors.maroonDark.withValues(alpha: 0.88),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    width: 84,
                    height: 84,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
                    ),
                    child: const Icon(Icons.movie_filter_rounded,
                        color: Colors.white, size: 40),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'CineTrip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Live the Movie',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: 16,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Viaje para dentro das suas cenas favoritas.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 52,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.maroon,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const Shell()),
                      ),
                      child: const Text(
                        'Começar',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============ NAVEGAÇÃO INFERIOR ============
class Shell extends StatefulWidget {
  const Shell({super.key});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final telas = [
      const Home(),
      const Explorar(),
      const Favoritos(),
      const Perfil(),
    ];
    return Scaffold(
      body: IndexedStack(index: _index, children: telas),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.maroon,
        unselectedItemColor: AppColors.textMuted,
        backgroundColor: Colors.white,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_rounded),
              label: 'Início'),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              activeIcon: Icon(Icons.explore_rounded),
              label: 'Explorar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded),
              activeIcon: Icon(Icons.favorite_rounded),
              label: 'Favoritos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              activeIcon: Icon(Icons.person_rounded),
              label: 'Perfil'),
        ],
      ),
    );
  }
}

// ============ 2. HOME ============
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 24),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Olá, Melissa',
                            style: TextStyle(
                                fontSize: 13, color: AppColors.textMuted)),
                        SizedBox(height: 2),
                        Text('Para onde vamos hoje?',
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                        color: AppColors.pink, shape: BoxShape.circle),
                    child: const Icon(Icons.notifications_none_rounded,
                        color: AppColors.maroon),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar por filme ou destino',
                  hintStyle: const TextStyle(
                      color: AppColors.textMuted, fontSize: 14),
                  prefixIcon: const Icon(Icons.search_rounded,
                      color: AppColors.textMuted),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: AppColors.pink),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: AppColors.pink),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 168,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.88),
                itemCount: 2,
                itemBuilder: (context, i) {
                  final p = pacotes[i];
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => Detalhe(pacote: p)),
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(p.imagem), fit: BoxFit.cover),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              AppColors.maroonDark.withValues(alpha: 0.9),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(p.genero.toUpperCase(),
                                style: const TextStyle(
                                    color: AppColors.pink,
                                    fontSize: 11,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(height: 6),
                            Text(p.filme,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(height: 4),
                            Text('${p.destino} · ${p.duracao}',
                                style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.85),
                                    fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 24, 20, 12),
              child: Text('Pacotes em Destaque',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            ),
            ...pacotes.map((p) => TilePacote(pacote: p)),
          ],
        ),
      ),
    );
  }
}

class TilePacote extends StatelessWidget {
  final Pacote pacote;
  const TilePacote({super.key, required this.pacote});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => Detalhe(pacote: pacote)),
      ),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 14),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                pacote.imagem,
                width: 86,
                height: 86,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                    width: 86,
                    height: 86,
                    color: AppColors.pink,
                    child: const Icon(Icons.movie_rounded,
                        color: AppColors.maroon)),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pacote.filme,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Text('${pacote.destino}, ${pacote.pais}',
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.textMuted)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded,
                          size: 15, color: AppColors.gold),
                      const SizedBox(width: 3),
                      Text(pacote.nota.toStringAsFixed(1),
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600)),
                      const SizedBox(width: 10),
                      Text(pacote.preco,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: AppColors.maroon)),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }
}

// ============ 3. EXPLORAR ============
class Explorar extends StatefulWidget {
  const Explorar({super.key});

  @override
  State<Explorar> createState() => _ExplorarState();
}

class _ExplorarState extends State<Explorar> {
  String _genero = 'Todos';

  @override
  Widget build(BuildContext context) {
    final lista = _genero == 'Todos'
        ? pacotes
        : pacotes.where((p) => p.genero == _genero).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Explorar')),
      body: Column(
        children: [
          SizedBox(
            height: 46,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                for (final g in ['Todos', ...generos])
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () => setState(() => _genero = g),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        decoration: BoxDecoration(
                          color: _genero == g ? AppColors.maroon : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: _genero == g
                                  ? AppColors.maroon
                                  : AppColors.pink),
                        ),
                        child: Text(g,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: _genero == g
                                    ? Colors.white
                                    : AppColors.textMuted)),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              itemCount: lista.length,
              itemBuilder: (context, i) {
                final p = lista[i];
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => Detalhe(pacote: p)),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 14,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(18)),
                              child: Image.network(
                                p.imagem,
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Container(
                                    height: 150, color: AppColors.pink),
                              ),
                            ),
                            Positioned(
                              top: 12,
                              left: 12,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: AppColors.maroon,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(p.genero,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                            Positioned(
                              top: 12,
                              right: 12,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.star_rounded,
                                        size: 16, color: AppColors.gold),
                                    const SizedBox(width: 4),
                                    Text(p.nota.toStringAsFixed(1),
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(p.filme,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                              const SizedBox(height: 4),
                              Text('${p.destino}, ${p.pais}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textMuted)),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(p.preco,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.maroon)),
                                  Text(p.duracao,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: AppColors.textMuted)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ============ 4. DETALHES ============
class Detalhe extends StatelessWidget {
  final Pacote pacote;
  const Detalhe({super.key, required this.pacote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pacote.destino)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(
              pacote.imagem,
              height: 210,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  Container(height: 210, color: AppColors.pink),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: AppColors.pink,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(pacote.genero,
                    style: const TextStyle(
                        color: AppColors.maroon,
                        fontSize: 11,
                        fontWeight: FontWeight.w700)),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.star_rounded, size: 17, color: AppColors.gold),
              const SizedBox(width: 4),
              Text(pacote.nota.toStringAsFixed(1),
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 12),
          Text(pacote.filme,
              style: const TextStyle(
                  fontSize: 23, fontWeight: FontWeight.w700, height: 1.2)),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.place_outlined,
                  size: 16, color: AppColors.textMuted),
              const SizedBox(width: 4),
              Text('${pacote.destino}, ${pacote.pais}',
                  style: const TextStyle(
                      fontSize: 13, color: AppColors.textMuted)),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Icon(Icons.schedule_rounded,
                          size: 20, color: AppColors.maroon),
                      const SizedBox(height: 6),
                      const Text('Duração',
                          style: TextStyle(
                              fontSize: 11, color: AppColors.textMuted)),
                      const SizedBox(height: 2),
                      Text(pacote.duracao,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
                Container(width: 1, height: 36, color: AppColors.pink),
                Expanded(
                  child: Column(
                    children: [
                      const Icon(Icons.payments_outlined,
                          size: 20, color: AppColors.maroon),
                      const SizedBox(height: 6),
                      const Text('A partir de',
                          style: TextStyle(
                              fontSize: 11, color: AppColors.textMuted)),
                      const SizedBox(height: 2),
                      Text(pacote.preco,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const Text('Sobre a experiência',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Text(pacote.sinopse,
              style: const TextStyle(
                  fontSize: 14, height: 1.6, color: AppColors.textMuted)),
          const SizedBox(height: 22),
          const Text('O que está incluso',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          ...pacote.incluso.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_rounded,
                        size: 18, color: AppColors.maroon),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Text(item,
                            style: const TextStyle(
                                fontSize: 14, height: 1.4))),
                  ],
                ),
              )),
          const SizedBox(height: 22),
          SizedBox(
            height: 52,
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.maroon),
                foregroundColor: AppColors.maroon,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Roteiro(pacote: pacote)),
              ),
              icon: const Icon(Icons.map_outlined),
              label: const Text('Ver roteiro no mapa',
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.maroon,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) => Orcamento(filme: pacote.filme)),
              ),
              child: const Text('Selecionar Pacote',
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}

// ============ 5. ROTEIRO COM MAPA ============
class Roteiro extends StatefulWidget {
  final Pacote pacote;
  const Roteiro({super.key, required this.pacote});

  @override
  State<Roteiro> createState() => _RoteiroState();
}

class _RoteiroState extends State<Roteiro> {
  final MapController _mapa = MapController();
  int _sel = 0;

  void _selecionar(int i) {
    setState(() => _sel = i);
    _mapa.move(widget.pacote.roteiro[i].local, 15.5);
  }

  Future<void> _abrirExterno() async {
    final p = widget.pacote.roteiro[_sel].local;
    final uri = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=${p.latitude},${p.longitude}');
    await launchUrl(uri, mode: LaunchMode.platformDefault);
  }

  @override
  Widget build(BuildContext context) {
    final pontos = widget.pacote.roteiro;

    return Scaffold(
      appBar: AppBar(title: const Text('Roteiro')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 340,
              child: Stack(
                children: [
                  FlutterMap(
                    mapController: _mapa,
                    options: MapOptions(
                      initialCenter: pontos.first.local,
                      initialZoom: 13.5,
                      minZoom: 3,
                      maxZoom: 18,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.cinetrip.app',
                      ),
                      MarkerLayer(
                        markers: [
                          for (int i = 0; i < pontos.length; i++)
                            Marker(
                              point: pontos[i].local,
                              width: 44,
                              height: 44,
                              child: GestureDetector(
                                onTap: () => _selecionar(i),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: i == _sel
                                        ? AppColors.maroon
                                        : Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppColors.maroon, width: 2),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withValues(alpha: 0.2),
                                        blurRadius: 6,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text('${i + 1}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: i == _sel
                                                ? Colors.white
                                                : AppColors.maroon)),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    right: 14,
                    bottom: 14,
                    child: Column(
                      children: [
                        _BotaoMapa(
                          icone: Icons.add_rounded,
                          onTap: () => _mapa.move(_mapa.camera.center,
                              _mapa.camera.zoom + 1),
                        ),
                        const SizedBox(height: 8),
                        _BotaoMapa(
                          icone: Icons.remove_rounded,
                          onTap: () => _mapa.move(_mapa.camera.center,
                              _mapa.camera.zoom - 1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(24)),
              ),
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              child: Column(
                children: [
                  ...List.generate(pontos.length, (i) {
                    final p = pontos[i];
                    final ativo = i == _sel;
                    return GestureDetector(
                      onTap: () => _selecionar(i),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: ativo ? AppColors.pinkSoft : Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                              color:
                                  ativo ? AppColors.maroon : AppColors.pink),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: ativo
                                  ? AppColors.maroon
                                  : AppColors.pink,
                              child: Text('${i + 1}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: ativo
                                          ? Colors.white
                                          : AppColors.maroon)),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(p.titulo,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700)),
                                  const SizedBox(height: 2),
                                  Text(p.descricao,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: AppColors.textMuted,
                                          height: 1.4)),
                                  const SizedBox(height: 4),
                                  Text(p.horario,
                                      style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.maroon)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 52,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.maroon,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: _abrirExterno,
                      icon: const Icon(Icons.open_in_new_rounded, size: 18),
                      label: const Text('Abrir no Google Maps',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
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

class _BotaoMapa extends StatelessWidget {
  final IconData icone;
  final VoidCallback onTap;
  const _BotaoMapa({required this.icone, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: SizedBox(
          width: 38,
          height: 38,
          child: Icon(icone, size: 20, color: AppColors.textDark),
        ),
      ),
    );
  }
}

// ============ 6. FAVORITOS ============
class Favoritos extends StatefulWidget {
  const Favoritos({super.key});

  @override
  State<Favoritos> createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  final Set<int> _favoritos = {0, 2};

  @override
  Widget build(BuildContext context) {
    final lista = _favoritos.map((i) => pacotes[i]).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos')),
      body: lista.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite_border_rounded,
                        size: 56, color: AppColors.pink),
                    SizedBox(height: 16),
                    Text('Nenhum favorito ainda',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700)),
                    SizedBox(height: 8),
                    Text(
                      'Toque no coração dos pacotes que você quer viver para salvá-los aqui.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.textMuted, height: 1.5),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              itemCount: lista.length,
              itemBuilder: (context, i) {
                final p = lista[i];
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => Detalhe(pacote: p)),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 14,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.network(p.imagem,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                  width: 80,
                                  height: 80,
                                  color: AppColors.pink)),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(p.filme,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                              const SizedBox(height: 4),
                              Text(p.destino,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textMuted)),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Icon(Icons.star_rounded,
                                      size: 15, color: AppColors.gold),
                                  const SizedBox(width: 3),
                                  Text(p.nota.toStringAsFixed(1),
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite_rounded,
                              color: AppColors.maroon),
                          onPressed: () => setState(
                              () => _favoritos.remove(pacotes.indexOf(p))),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// ============ 7. ORÇAMENTO ============
class Orcamento extends StatefulWidget {
  final String? filme;
  const Orcamento({super.key, this.filme});

  @override
  State<Orcamento> createState() => _OrcamentoState();
}

class _OrcamentoState extends State<Orcamento> {
  final _form = GlobalKey<FormState>();
  late final TextEditingController _filme;
  final _destino = TextEditingController();
  final _periodo = TextEditingController();
  final _viajantes = TextEditingController(text: '2');

  @override
  void initState() {
    super.initState();
    _filme = TextEditingController(text: widget.filme ?? '');
  }

  @override
  void dispose() {
    _filme.dispose();
    _destino.dispose();
    _periodo.dispose();
    _viajantes.dispose();
    super.dispose();
  }

  void _enviar() {
    if (!_form.currentState!.validate()) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Solicitação enviada! Em breve entraremos em contato.'),
        backgroundColor: AppColors.maroon,
      ),
    );
    Navigator.of(context).pop();
  }

  Widget _label(String t) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(t,
            style: const TextStyle(
                fontSize: 13, fontWeight: FontWeight.w600)),
      );

  InputDecoration _deco(String hint) => InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.pink),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.pink),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Solicitar Orçamento')),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            const Text('Conte o que você imagina',
                style:
                    TextStyle(fontSize: 21, fontWeight: FontWeight.w700)),
            const SizedBox(height: 6),
            const Text(
                'Montamos um roteiro personalizado a partir do seu filme favorito.',
                style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textMuted,
                    height: 1.5)),
            const SizedBox(height: 22),
            _label('Filme de interesse'),
            TextFormField(
              controller: _filme,
              decoration: _deco('Ex.: Um Amor em Notting Hill'),
              validator: (v) =>
                  (v == null || v.isEmpty) ? 'Informe o filme' : null,
            ),
            const SizedBox(height: 16),
            _label('Destino preferido'),
            TextFormField(
              controller: _destino,
              decoration: _deco('Ex.: Londres'),
              validator: (v) =>
                  (v == null || v.isEmpty) ? 'Informe o destino' : null,
            ),
            const SizedBox(height: 16),
            _label('Período da viagem'),
            TextFormField(
              controller: _periodo,
              decoration: _deco('Ex.: Julho de 2027'),
              validator: (v) =>
                  (v == null || v.isEmpty) ? 'Informe o período' : null,
            ),
            const SizedBox(height: 16),
            _label('Número de viajantes'),
            TextFormField(
              controller: _viajantes,
              keyboardType: TextInputType.number,
              decoration: _deco('Ex.: 2'),
              validator: (v) {
                final n = int.tryParse(v ?? '');
                if (n == null || n < 1) return 'Informe um número válido';
                return null;
              },
            ),
            const SizedBox(height: 28),
            SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.maroon,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: _enviar,
                child: const Text('Enviar solicitação',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============ 8. PERFIL ============
class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  width: 92,
                  height: 92,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.pink,
                    border: Border.all(color: AppColors.maroon, width: 2),
                  ),
                  child: const Icon(Icons.person_rounded,
                      size: 48, color: AppColors.maroon),
                ),
                const SizedBox(height: 14),
                const Text('Melissa Silvério',
                    style: TextStyle(
                        fontSize: 19, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                const Text('melissa.silverio@email.com',
                    style: TextStyle(
                        fontSize: 13, color: AppColors.textMuted)),
              ],
            ),
          ),
          const SizedBox(height: 28),
          _ItemPerfil(
            icone: Icons.luggage_outlined,
            texto: 'Minhas Viagens',
            onTap: () {},
          ),
          _ItemPerfil(
            icone: Icons.favorite_border_rounded,
            texto: 'Meus Favoritos',
            onTap: () {},
          ),
          _ItemPerfil(
            icone: Icons.request_quote_outlined,
            texto: 'Solicitações de Orçamento',
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const Orcamento()),
            ),
          ),
          _ItemPerfil(
            icone: Icons.help_outline_rounded,
            texto: 'Ajuda e Suporte',
            onTap: () {},
          ),
          const SizedBox(height: 8),
          _ItemPerfil(
            icone: Icons.logout_rounded,
            texto: 'Sair',
            perigo: true,
            onTap: () => Navigator.of(context)
                .popUntil((r) => r.isFirst),
          ),
        ],
      ),
    );
  }
}

class _ItemPerfil extends StatelessWidget {
  final IconData icone;
  final String texto;
  final VoidCallback onTap;
  final bool perigo;

  const _ItemPerfil({
    required this.icone,
    required this.texto,
    required this.onTap,
    this.perigo = false,
  });

  @override
  Widget build(BuildContext context) {
    final cor = perigo ? const Color(0xFFB3261E) : AppColors.textDark;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14)),
        leading: Icon(icone, color: perigo ? cor : AppColors.maroon),
        title: Text(texto,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: cor)),
        trailing: const Icon(Icons.chevron_right_rounded,
            color: AppColors.textMuted),
      ),
    );
  }
}