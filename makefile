
all: format clean install build-apk

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
	@flutter build apk --dart-define=DART_DEFINE_APP_ENV=releasea
	@echo "...... build android end <======"