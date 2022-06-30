// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });
  group('Happy Paths', () {
    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "French Press"

      And I enter "5"

      Then I should see "63g - course ground coffee"
      And I should see "887g - water"
    */
    test("should give recommendation for French Press", () async {
      // your code here
      final french = find.byValueKey('French');
      final continueMach = find.byValueKey('ContinueMachine');
      final cups = find.byValueKey('Cups');
      final continueCups = find.byValueKey('ContinueCups');
      final done = find.byValueKey('DoneR');
      final coffee = find.byValueKey('Coffee');
      final water = find.byValueKey('Water');

      await driver.tap(french);
      await driver.tap(continueMach);

      await driver.tap(cups);
      await driver.enterText('5');
      await driver.waitFor(find.text('5'));
      await driver.tap(continueCups);

      expect(await driver.getText(coffee), "63g - course ground coffee");
      expect(await driver.getText(water), "887g - water");

      await driver.tap(done);
      await Future.delayed(const Duration(seconds: 1));
    });

    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "Drip Machine"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "52g - medium ground coffee"
      And I should see "887g - water"
    */
    test("should give recommendation for Drip Machine", () async {
      //your code here
      final drip = find.byValueKey('Drip');
      final continueMach = find.byValueKey('ContinueMachine');
      final cups = find.byValueKey('Cups');
      final continueCups = find.byValueKey('ContinueCups');
      final done = find.byValueKey('DoneR');
      final coffee = find.byValueKey('Coffee');
      final water = find.byValueKey('Water');

      await driver.tap(drip);
      await driver.tap(continueMach);

      await driver.tap(cups);
      await driver.enterText('5');
      await driver.waitFor(find.text('5'));
      await driver.tap(continueCups);

      expect(await driver.getText(coffee), "52g - medium ground coffee");
      expect(await driver.getText(water), "887g - water");

      await driver.tap(done);
      await Future.delayed(const Duration(seconds: 1));
    });
  });

  group('Sad Paths', () {
    /*
      Given I am on the Coffee Device Selection Screen
      When I press "Continue"
      Then I expect to still be on the Coffee Device Selection Screen
    */
    test("should not advance from Choose Device Screen without a selection",
        () async {
      //your code here
      final deviceScreen = find.byValueKey('deviceScreen');
      final french = find.byValueKey('French');
      final drip = find.byValueKey('Drip');
      final continueMach = find.byValueKey('ContinueMachine');

      await driver.tap(french);
      await Future.delayed(const Duration(seconds: 1));
      await driver.tap(french);
      await driver.tap(continueMach);
      await Future.delayed(const Duration(seconds: 1));
      await driver.tap(drip);
      await Future.delayed(const Duration(seconds: 1));
      await driver.tap(drip);
      await driver.tap(continueMach);
      await Future.delayed(const Duration(seconds: 1));

      expect(await driver.getText(deviceScreen),
          "What coffee maker are you using?");
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen without cups", () async {
      //your code here
      final french = find.byValueKey('French');
      final continueMach = find.byValueKey('ContinueMachine');
      final continueCups = find.byValueKey('ContinueCups');
      final cupScreen = find.byValueKey('cupScreen');
      final backBtnC = find.byValueKey('backButtonCups');

      await driver.tap(french);
      await driver.tap(continueMach);
      await driver.tap(continueCups);

      expect(
        await driver.getText(cupScreen),
        "How many cups would you like?",
      );
      await Future.delayed(const Duration(seconds: 1));
      await driver.tap(backBtnC);
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "-1"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */

    //Keyboard only lets user enter numbers
    test("should not advance from Choose Cups Screen with negative cup amount",
        () async {
      //your code here
    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen without cups", () async {
      //your code here
      final continueMach = find.byValueKey('ContinueMachine');
      final cups = find.byValueKey('Cups');
      final continueCups = find.byValueKey('ContinueCups');
      final cupScreen = find.byValueKey('cupScreen');

      final done = find.byValueKey('DoneR');

      await driver.tap(continueMach);
      await driver.tap(cups);
      await driver.enterText('0');
      await driver.waitFor(find.text('0'));
      await driver.tap(continueCups);

      expect(
        await driver.getText(cupScreen),
        "How many cups would you like?",
      );

      await driver.tap(cups);
      await driver.enterText('5');
      await driver.tap(continueCups);
      await driver.tap(done);
    });
  });

  group('Back Button', () {
    //make up your own tests to check that the back button works
    //on every page
    test("Checking if back button works on all pages", () async {
      final french = find.byValueKey('French');
      final continueMach = find.byValueKey('ContinueMachine');
      final cups = find.byValueKey('Cups');
      final continueCups = find.byValueKey('ContinueCups');
      final coffee = find.byValueKey('Coffee');
      final water = find.byValueKey('Water');
      final backBtnC = find.byValueKey('backButtonCups');
      final backBtnR = find.byValueKey('backButtonRec');

      await driver.tap(french);
      await driver.tap(continueMach);

      await driver.tap(cups);
      await driver.enterText('5');
      await driver.waitFor(find.text('5'));
      await driver.tap(continueCups);

      expect(await driver.getText(coffee), "63g - course ground coffee");
      expect(await driver.getText(water), "887g - water");
      await Future.delayed(const Duration(seconds: 1));

      await driver.tap(backBtnR);
      await Future.delayed(const Duration(seconds: 2));
      await driver.tap(backBtnC);
    });
  });
}
