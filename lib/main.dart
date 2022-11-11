import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:zv/goods_list/bloc/goods_bloc.dart';
import 'package:zv/log_in/bloc/login_bloc.dart';
import 'package:zv/log_in/login_page.dart';

import 'common/theme.dart';
import 'dynamic_routes/dynamic_routes_builder.dart';
import 'fire_base/firebase_options.dart';

void main() {
  runZonedGuarded( 
    () async {
      WidgetsFlutterBinding.ensureInitialized();
        
      await Firebase.initializeApp( options: DefaultFirebaseOptions.firebaseConfigWeb );

        FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
        //await configureDependencies();
        runApp(const MyApp());
    },

  (error,stack) => FirebaseCrashlytics.instance.recordError( error, stack, printDetails: true )

  );
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){
    return MultiProvider(
      providers: [
        BlocProvider( create: (context) => LoginBloc()..add( const LoginInitialEvent() ) ),
        BlocProvider( create: (context) => GoodsBloc()..add( const GoodsEventInit()    ) ),
      ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        restorationScopeId: 'app',
        theme:              mainTheme(),
        title:              'Store App',

        onGenerateRoute:( settings ){
          if( settings.name?.startsWith( '/goods_page' )?? false ){
            return animatedMaterialPageRoute( settings );
          }
          return null;
        },
        
        routes: {
          '/login_page': (context) => const LoginPage(),
        },

        home: Column(
          children: [
            const Expanded( child: LoginPage() ),

            BlocListener<LoginBloc, LoginState>(
              child:    const SizedBox( height: 1 ),

              listener: (context, state ){

                if( (state is LoginResultState) &&
                    (state.props.isNotEmpty)    && 
                    (state.props[0] == true)
                  ) {
                    BlocProvider.of<GoodsBloc>( context ).add( const GoodsEventLoad() );
                    Navigator.pushNamed( context, '/goods_page' );
                }

                if( (state is LoginResultState) &&
                    (state.props.isNotEmpty)    && 
                    (state.props[0] == false)
                  ){
                    const snackBar = SnackBar( content: Text('wrong data! Maybe are you a new user?') );
                    ScaffoldMessenger.of( context ).showSnackBar( snackBar );
                }

              },
            )
          ],
        ),
      ),
    );
  }

}
