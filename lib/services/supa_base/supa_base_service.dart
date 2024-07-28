import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBaseService {
  SupaBaseService._internal() {
    initializeSupabase();
  }
  static final SupaBaseService instance = SupaBaseService._internal();

  static Future<void> initializeSupabase() async {
    try {
      await Supabase.initialize(
        url: 'https://lhlicweewczcwaxzzuvp.supabase.co',
        anonKey:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxobGljd2Vld2N6Y3dheHp6dXZwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjIxNTgyMTYsImV4cCI6MjAzNzczNDIxNn0.HYvju6pFI_3KY_5yElNQ2ZrKmRbMXuJBGAlIatjsypM',
      );
      Logger().i('Supabase initialized successfully');
    } catch (e) {
      Logger().e('Error initializing Supabase: $e');
    }
  }
}

final supabase = Supabase.instance.client;
