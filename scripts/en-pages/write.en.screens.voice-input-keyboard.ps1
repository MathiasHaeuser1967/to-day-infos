function Write-En-Screen-VoiceInputKeyboard {
  $p = Join-Path $Screens 'voice-input-keyboard.md'
  $c = @'
# Voice input (keyboard)

Use the **microphone** button on your keyboard to dictate text. The app only receives the recognized text; audio is **not** stored by the app.

Tips:
- Download offline speech data in system settings for reliability.
- Speak punctuation when needed.
- Check the FAQ if TTS or recognition is unreliable on your device.
'@
  Write-File $p $c
}