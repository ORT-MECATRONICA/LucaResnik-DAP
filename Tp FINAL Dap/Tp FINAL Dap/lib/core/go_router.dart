import 'package:dapfinal1/screens/add_peli_screen.dart';  
import 'package:dapfinal1/screens/crearuser.dart';
import 'package:dapfinal1/screens/home_screen.dart';  
import 'package:dapfinal1/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    name: LoginScreen.name,
    path: '/',
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(
    name: UserScreen.name,
    path: '/crearusuario',
    builder: (context, state) => const UserScreen(),
  ),
  GoRoute(
    name: HomeScreen.name,
    path: '/home',
    builder: (context, state) => const HomeScreen(),  
  ),
  GoRoute(
    name: AddPeliScreen.name,  // Cambié AddMemeScreen a AddPeliScreen
    path: '/addpeli',  // Cambié la ruta a /addpeli
    builder: (context, state) => AddPeliScreen(),  
  ),
]);
