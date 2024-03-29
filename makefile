# TESTS:

all-tests : tests integration-tests

tests : 
	rm -rf coverage && flutter test --coverage

tests-ci-cd : 
	rm -rf coverage && flutter test --coverage --dart-define=runningOnCICD=true


integration-tests : 
	flutter test integration_test/app_test.dart

lcov-ignore : 
	lcov --remove coverage/lcov.info 'lib/core/*' 'lib/models/*.g.dart' -o coverage/lcov.info --ignore-errors unused


lcov : tests lcov-ignore
	genhtml -q -o coverage coverage/lcov.info && open coverage/index.html

update-goldens : remove-goldens-failures
	flutter test --update-goldens

remove-goldens-failures : 
	rm test/golden_test/failures/*

# BUILD

flutter-build :
	flutter build appbundle

android-fastlane :
	cd android && fastlane android

# CODE GENERATION

fix :
	dart fix --apply

l10n :
	flutter gen-l10n && arb_utils sort lib/l10n/app_en.arb 

gen :
	flutter packages pub run build_runner build --delete-conflicting-outputs

get :
	flutter pub get 

clean :
	flutter clean 
