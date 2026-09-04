import 'package:go_router/go_router.dart';
import 'package:tp3/screens/login_screen.dart';
import 'package:tp3/screens/register_screen.dart';
import 'package:tp3/screens/home_screen.dart';
import 'package:tp3/screens/detalle_screen.dart';
import 'package:tp3/screens/form_herramienta_screen.dart';
import 'package:tp3/entities/herramienta.dart';

final GoRouter appRoutes = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/register', builder: (context, state) => const RegisterScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/detalle',
      builder: (context, state) {
        final productoSeleccionado = state.extra as Herramienta;
        return DetalleScreen(product: productoSeleccionado);
      },
    ),
    GoRoute(
      path: '/formulario',
      builder: (context, state) {
        // Si viene un extra, se edita; si viene null, se crea uno nuevo
        final herramienta = state.extra as Herramienta?;
        return FormHerramientaScreen(herramienta: herramienta);
      },
    ),
  ],
);