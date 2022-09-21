
all: format clean install build-apk build-bundle build-ipa

format:
	@echo "======> Format project ......"
	dart format .
	@echo "....... Format end    <======"

clean: 
	@echo "======> Cleaning project ......"
	@rm -rf pubspec.lock
	@flutter clean
	@echo "....... Cleaning end    <======"

install:
	@echo "======> Install pub data ......"
	@flutter pub get
	@echo "....... Install end     <======"

build-apk:
	@echo "======> build android apk ......"
	@flutter build apk --dart-define=DART_DEFINE_APP_ENV=release --dart-define=BUILD_CHANNEL=android-browser
	@echo "...... build android end <======"

build-bundle:
	@echo "======> build android appbundle ......"
	@flutter build appbundle --dart-define=DART_DEFINE_APP_ENV=release --dart-define=BUILD_CHANNEL=android-google
	@echo "...... build android appbundle end <======"


build-ipa:
	@echo "======> build ios ipa ......"
	@flutter build ipa --dart-define=DART_DEFINE_APP_ENV=release --dart-define=BUILD_CHANNEL=ios-browser --export-method=development
	@echo "...... build ios ipa end <======"