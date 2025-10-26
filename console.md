Generate Firebase options
11s



Show command
Showing the last 50 lines. Click this button to load the full log
⠹ Fetching available Firebase projects...                                       
⠸ Fetching available Firebase projects...                                       
⠼ Fetching available Firebase projects...                                       
⠴ Fetching available Firebase projects...                                       
⠦ Fetching available Firebase projects...                                       
⠧ Fetching available Firebase projects...                                       
⠇ Fetching available Firebase projects...                                       
⠏ Fetching available Firebase projects...                                       
⠋ Fetching available Firebase projects...                                       
i Found 1 Firebase projects. Selecting project todo-app-87ef1.                  
[?25hi Selected platforms: android
[?25l⠋ Fetching registered android Firebase apps for project todo-app-87ef1          
⠙ Fetching registered android Firebase apps for project todo-app-87ef1          
⠹ Fetching registered android Firebase apps for project todo-app-87ef1          
⠸ Fetching registered android Firebase apps for project todo-app-87ef1          
⠼ Fetching registered android Firebase apps for project todo-app-87ef1          
⠴ Fetching registered android Firebase apps for project todo-app-87ef1          
⠦ Fetching registered android Firebase apps for project todo-app-87ef1          
⠧ Fetching registered android Firebase apps for project todo-app-87ef1          
⠇ Fetching registered android Firebase apps for project todo-app-87ef1          
⠏ Fetching registered android Firebase apps for project todo-app-87ef1          
⠋ Fetching registered android Firebase apps for project todo-app-87ef1          
⠙ Fetching registered android Firebase apps for project todo-app-87ef1          
⠹ Fetching registered android Firebase apps for project todo-app-87ef1          
⠸ Fetching registered android Firebase apps for project todo-app-87ef1          
⠼ Fetching registered android Firebase apps for project todo-app-87ef1          
⠴ Fetching registered android Firebase apps for project todo-app-87ef1          
⠦ Fetching registered android Firebase apps for project todo-app-87ef1          
⠧ Fetching registered android Firebase apps for project todo-app-87ef1          
⠇ Fetching registered android Firebase apps for project todo-app-87ef1          
⠏ Fetching registered android Firebase apps for project todo-app-87ef1          
⠋ Fetching registered android Firebase apps for project todo-app-87ef1          
⠙ Fetching registered android Firebase apps for project todo-app-87ef1          
⠹ Fetching registered android Firebase apps for project todo-app-87ef1          
⠸ Fetching registered android Firebase apps for project todo-app-87ef1          
⠼ Fetching registered android Firebase apps for project todo-app-87ef1          
⠴ Fetching registered android Firebase apps for project todo-app-87ef1          
⠦ Fetching registered android Firebase apps for project todo-app-87ef1          
⠧ Fetching registered android Firebase apps for project todo-app-87ef1          
⠇ Fetching registered android Firebase apps for project todo-app-87ef1          
i Firebase android app com.example.todo_app registered.                         
[?25h
Firebase configuration file lib/firebase_options.dart generated successfully with the following Firebase apps:

Platform  Firebase App Id
android   1:273380534383:android:659f81529a4d2991e5459a

Learn more about using this file and next steps from the documentation:
 > https://firebase.google.com/docs/flutter/setup

Conditional Build (APK)
< 1s



Hide command
#!/usr/bin/env bash

if [ "$BUILD_TOOL" = "shorebird" ]; then
  echo "Building with Shorebird..."
  shorebird build apk --release
else
  echo "Building with Flutter..."
  flutter build apk --release
fi
Building with Shorebird...
/var/folders/w2/rrf5p87d1bbfyphxc7jdnyvh0000gn/T/build_script_8_1_vmrgie20: line 5: shorebird: command not found


Build failed :|
Step 8 script `Conditional Build (APK)` exited with status code 127