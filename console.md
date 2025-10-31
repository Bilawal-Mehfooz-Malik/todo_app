Restarted application in 3,533ms.
I/flutter ( 5896): [INFO] [2025-10-30 16:40:07.094020] TodoCubit initialized
D/EGL_emulation( 5896): app_time_stats: avg=40581.92ms min=40581.92ms max=40581.92ms count=1
D/EGL_emulation( 5896): app_time_stats: avg=52.72ms min=18.83ms max=149.03ms count=19
D/EGL_emulation( 5896): app_time_stats: avg=57.13ms min=12.49ms max=167.61ms count=18
I/flutter ( 5896): [INFO] [2025-10-30 16:40:10.797138] Todos loaded successfully
D/EGL_emulation( 5896): app_time_stats: avg=92.88ms min=25.71ms max=673.47ms count=14
D/EGL_emulation( 5896): app_time_stats: avg=4151.90ms min=46.98ms max=8256.83ms count=2
[MessageInputBar] Initializing cubit from MessageInputBar
[SpeechCubit] Initializing Cubit...
[SpeechService] Initializing SpeechRecognitionService...
[SpeechService] Requesting permissions...
[MessageInputBar] BlocBuilder received state: SpeechRecognitionLoading()
[MessageInputBar] Building mic button
W/WindowOnBackDispatcher( 5896): OnBackInvokedCallback is not enabled for the application.
W/WindowOnBackDispatcher( 5896): Set 'android:enableOnBackInvokedCallback="true"' in the application manifest.
[SpeechService] Microphone permission status: PermissionStatus.granted
[SpeechService] Speech permission status: PermissionStatus.granted
[SpeechService] Permissions granted.
[SpeechService] Initialization successful.
[SpeechCubit] Cubit status changed: SpeechRecognitionStatus.available
[SpeechCubit] Cubit new state: SpeechRecognitionAvailable()
[MessageInputBar] BlocListener received state: SpeechRecognitionAvailable()
[MessageInputBar] BlocBuilder received state: SpeechRecognitionAvailable()
[MessageInputBar] Building mic button
D/EGL_emulation( 5896): app_time_stats: avg=503.46ms min=67.26ms max=1121.60ms count=4
[SpeechCubit] Cubit startListening called
[SpeechService] Starting to listen...
[SpeechCubit] Cubit status changed: SpeechRecognitionStatus.listening
[SpeechCubit] Cubit new state: SpeechRecognitionListening()
[MessageInputBar] BlocListener received state: SpeechRecognitionListening()
[MessageInputBar] BlocBuilder received state: SpeechRecognitionListening()
[MessageInputBar] Building stop button
[SpeechService] Status: listening
[SpeechService] Status: notListening
[SpeechCubit] Cubit status changed: SpeechRecognitionStatus.stopped
[SpeechCubit] Cubit new state: SpeechRecognitionAvailable()
[SpeechService] Status: done
[SpeechCubit] Cubit status changed: SpeechRecognitionStatus.available
[SpeechCubit] Cubit new state: SpeechRecognitionAvailable()
[MessageInputBar] BlocListener received state: SpeechRecognitionAvailable()
[SpeechCubit] Cubit status changed: SpeechRecognitionStatus.error
[SpeechCubit] Cubit new state: SpeechRecognitionError()
[SpeechCubit] Cubit words changed: Error: error_language_unavailable
[SpeechCubit] Cubit new state from words changed: SpeechRecognitionError()
[MessageInputBar] BlocListener received state: SpeechRecognitionError()
[SpeechService] Error: error_language_unavailable
[SpeechService] SpeechRecognitionError (SpeechRecognitionError msg: error_language_unavailable, permanent: true)
[MessageInputBar] BlocBuilder received state: SpeechRecognitionError()
[MessageInputBar] Building mic button
D/EGL_emulation( 5896): app_time_stats: avg=69.05ms min=19.07ms max=613.33ms count=19
D/EGL_emulation( 5896): app_time_stats: avg=2528.54ms min=2528.54ms max=2528.54ms count=1
[SpeechCubit] Cubit startListening called
[SpeechService] Starting to listen...
[SpeechCubit] Cubit words changed:
[SpeechCubit] Cubit new state from words changed: SpeechRecognitionError()
[SpeechCubit] Cubit status changed: SpeechRecognitionStatus.listening
[SpeechCubit] Cubit new state: SpeechRecognitionListening()
[MessageInputBar] BlocListener received state: SpeechRecognitionListening()
[SpeechService] Status: listening
[MessageInputBar] BlocBuilder received state: SpeechRecognitionListening()
[MessageInputBar] Building stop button
[SpeechService] Status: notListening
[SpeechCubit] Cubit status changed: SpeechRecognitionStatus.stopped
[SpeechCubit] Cubit new state: SpeechRecognitionAvailable()
[SpeechService] Status: done
[SpeechCubit] Cubit status changed: SpeechRecognitionStatus.available
[SpeechCubit] Cubit new state: SpeechRecognitionAvailable()
[SpeechCubit] Cubit status changed: SpeechRecognitionStatus.error
[SpeechCubit] Cubit new state: SpeechRecognitionError()
[SpeechCubit] Cubit words changed: Error: error_language_unavailable
[SpeechCubit] Cubit new state from words changed: SpeechRecognitionError()
[MessageInputBar] BlocListener received state: SpeechRecognitionAvailable()
[MessageInputBar] BlocListener received state: SpeechRecognitionError()
[SpeechService] Error: error_language_unavailable
[SpeechService] SpeechRecognitionError (SpeechRecognitionError msg: error_language_unavailable, permanent: true)
[MessageInputBar] BlocBuilder received state: SpeechRecognitionError()
[MessageInputBar] Building mic button
D/EGL_emulation( 5896): app_time_stats: avg=58.21ms min=7.86ms max=424.29ms count=18
D/EGL_emulation( 5896): app_time_stats: avg=11617.85ms min=11617.85ms max=11617.85ms count=1
[SpeechCubit] Cubit startListening called
[SpeechService] Starting to listen...
[SpeechCubit] Cubit words changed:
[SpeechCubit] Cubit new state from words changed: SpeechRecognitionError()
[SpeechCubit] Cubit status changed: SpeechRecognitionStatus.listening
[SpeechCubit] Cubit new state: SpeechRecognitionListening()
[MessageInputBar] BlocListener received state: SpeechRecognitionListening()
[SpeechService] Status: listening
[MessageInputBar] BlocBuilder received state: SpeechRecognitionListening()
[MessageInputBar] Building stop button
[SpeechService] Status: notListening
[SpeechCubit] Cubit status changed: SpeechRecognitionStatus.stopped
[SpeechCubit] Cubit new state: SpeechRecognitionAvailable()
[SpeechService] Status: done
[SpeechCubit] Cubit status changed: SpeechRecognitionStatus.available
[SpeechCubit] Cubit new state: SpeechRecognitionAvailable()
[MessageInputBar] BlocListener received state: SpeechRecognitionAvailable()
[SpeechCubit] Cubit status changed: SpeechRecognitionStatus.error
[SpeechCubit] Cubit new state: SpeechRecognitionError()
[SpeechCubit] Cubit words changed: Error: error_language_unavailable
[SpeechCubit] Cubit new state from words changed: SpeechRecognitionError()
[MessageInputBar] BlocListener received state: SpeechRecognitionError()
[SpeechService] Error: error_language_unavailable
[SpeechService] SpeechRecognitionError (SpeechRecognitionError msg: error_language_unavailable, permanent: true)
[MessageInputBar] BlocBuilder received state: SpeechRecognitionError()
[MessageInputBar] Building mic button
D/EGL_emulation( 5896): app_time_stats: avg=62.34ms min=11.79ms max=578.69ms count=20