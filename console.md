Running Gradle task 'assembleDebug'...                             71.0s
√ Built build\app\outputs\flutter-apk\app-debug.apk
Installing build\app\outputs\flutter-apk\app-debug.apk...           7.3s

══╡ EXCEPTION CAUGHT BY FLUTTER TEST FRAMEWORK ╞════════════════════════════════════════════════════
The following FirebaseException was thrown running a test:
[core/no-app] No Firebase App '[DEFAULT]' has been created - call Firebase.initializeApp()

When the exception was thrown, this was the stack:
#0      MethodChannelFirebase.app (package:firebase_core_platform_interface/src/method_channel/method_channel_firebase.dart:190:5)
#1      Firebase.app (package:firebase_core/src/firebase.dart:91:41)
#2      FirebaseAI.googleAI (package:firebase_ai/src/firebase_ai.dart:101:22)
#3      AppInitializer._setupDependencies (package:todo_app/src/app_initializer.dart:55:30)
#4      AppInitializer.initializeAndRun (package:todo_app/src/app_initializer.dart:38:5)
#5      main.<anonymous closure>.<anonymous closure> (file:///E:/Common/Apps/todo_app/integration_test/app_test.dart:20:50)
app_test.dart:20
#6      testWidgets.<anonymous closure>.<anonymous closure> (package:flutter_test/src/widget_tester.dart:192:29)
<asynchronous suspension>
#7      TestWidgetsFlutterBinding._runTestBody (package:flutter_test/src/binding.dart:1059:5)
2
<asynchronous suspension>
(elided one frame from package:stack_trace)

The test description was:
  tap on the floating action button, verify that a new task is created
════════════════════════════════════════════════════════════════════════════════════════════════════
Test failed. See exception logs above.
The test description was: tap on the floating action button, verify that a new task is created

✖ end-to-end test tap on the floating action button, verify that a new task is created