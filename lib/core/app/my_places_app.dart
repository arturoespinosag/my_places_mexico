import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/features/features.dart';
import 'package:myplaces_mexico/src/data/client/api_client.dart';
import 'package:myplaces_mexico/src/domain/domain.dart';

class MyPlacesApp extends StatelessWidget {
  const MyPlacesApp({super.key, required, required this.placesRepository});

  final IPlacesRepository placesRepository;

  @override
  Widget build(BuildContext context) {
    ApiClient.instance.init(baseUrl: ApiConfig.prod.http);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => placesRepository,
        )
      ],
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: DevicePreview(
          enabled: false,
          builder: (context) => MaterialApp(
            // ignore: deprecated_member_use
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            home: const HomePage(),
            theme: AppTheme.light,
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}
