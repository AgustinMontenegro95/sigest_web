import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/domain/bloc/auth/auth_bloc.dart';
import 'package:sigest/domain/bloc/log/log_bloc.dart';
import 'package:sigest/domain/bloc/product/product_bloc.dart';

import 'package:sigest/domain/bloc/user/user_bloc.dart';

import 'package:sigest/domain/repositories/auth_repository.dart';
import 'package:sigest/domain/repositories/log_repository.dart';
import 'package:sigest/domain/repositories/product_repository.dart';
import 'package:sigest/domain/repositories/user_repository.dart';

import 'package:sigest/firebase_options.dart';
import 'package:sigest/ui/pages/home/home_page.dart';

import 'package:sigest/ui/pages/login/login_page.dart';

import 'package:sigest/ui/routes/custom_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider(
          create: (context) => ProductRepository(),
        ),
        RepositoryProvider(
          create: (context) => LogRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
                authRepository: RepositoryProvider.of<AuthRepository>(context)),
          ),
          BlocProvider(
            create: (context) => UserBloc(
                userRepository: RepositoryProvider.of<UserRepository>(context))
              ..add(const UserEvent.get()),
          ),
          BlocProvider(
            create: (context) => ProductBloc(
                productRepository:
                    RepositoryProvider.of<ProductRepository>(context))
              ..add(const ProductEvent.getActive()),
          ),
          BlocProvider(
            create: (context) => LogBloc(
                logRepository: RepositoryProvider.of<LogRepository>(context))
              ..add(const LogEvent.get()),
          )
        ],
        child: FluentApp(
          /* builder: (context, widget) => ResponsiveWrapper.builder(
              ClampingScrollWrapper.builder(context, widget!),
              defaultScale: true,
              minWidth: 450,
              defaultName: TABLET,
              breakpoints: [
                const ResponsiveBreakpoint.resize(360),
                const ResponsiveBreakpoint.resize(450, name: MOBILE),
                const ResponsiveBreakpoint.resize(640, name: 'MOBILE_LARGE'),
                const ResponsiveBreakpoint.autoScale(700, name: TABLET),
              ],
              background: Container(color: Colors.black)), */
          debugShowCheckedModeBanner: false,
          title: 'SiGeSt',
          routes: customRoutes,
          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: 'cambria',
          ),
          home: kIsWeb
              ? const LogInPage()
              : StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return const HomePage();
                    }
                    return const LogInPage();
                  },
                ),
        ),
      ),
    );
  }
}
