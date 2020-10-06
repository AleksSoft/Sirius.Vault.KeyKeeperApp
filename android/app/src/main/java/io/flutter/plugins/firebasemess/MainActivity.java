package io.flutter.plugins.firebasemess;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.firebase.core.FlutterFirebaseCorePlugin;
import io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin;

public class MainActivity extends FlutterActivity {
  @Override
  public void configureFlutterEngine(FlutterEngine flutterEngine) {
    flutterEngine.getPlugins().add(new FirebaseMessagingPlugin());
    flutterEngine.getPlugins().add(new FlutterFirebaseCorePlugin());
  }
}