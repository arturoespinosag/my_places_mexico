init:
	flutter clean && flutter pub get && dart run build_runner build --delete-conflicting-outputs

flutter_gen:
	flutter pub get && fluttergen -c pubspec.yaml