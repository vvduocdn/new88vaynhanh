import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vaynow_flutter/services/supa_base/supa_base_service.dart';

class SupaBaseApi {
  Future<List<Map<String, dynamic>>> checkPhone(String phone) async {
    try {
      final data = await supabase.from('account').select().eq('phone', phone);
      return data;
    } on PostgrestException catch (error) {
      Logger().e('PostgrestException: $error');
    } catch (error) {
      Logger().e('getPinChatGroupById Errr: $error');
    }
    return [];
  }

  Future<List<Map<String, dynamic>>> insertAccount(String phone) async {
    try {
      final response = await supabase.from('account').insert([
        {
          "phone": phone,
          "user_name": 'user$phone',
        }
      ]).select();
      return response;
      Logger().i(response);
    } on PostgrestException catch (error) {
      Logger().e('PostgrestException: $error');
    } catch (e) {
      Logger().i('Insert ChatPin Failure');
    }
    return [];
  }

  Future<List<Map<String, dynamic>>> getStatusApp() async {
    try {
      final data = await supabase.from('option_app').select();
      return data;
    } on PostgrestException catch (error) {
      Logger().e('PostgrestException: $error');
    } catch (error) {
      Logger().e('getStatusApp Errr: $error');
    }
    return [];
  }
}
