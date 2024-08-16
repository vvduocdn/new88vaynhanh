import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:new88_vaynow/services/supa_base/supa_base_service.dart';

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

  Future<List<Map<String, dynamic>>> insertAccount(String phone, String pass, int money) async {
    try {
      final response = await supabase.from('account').insert([
        {"phone": phone, "user_name": 'user$phone', "password": pass, "money": money}
      ]).select();
      Logger().i(response);
      return response;
    } on PostgrestException catch (error) {
      Logger().e('PostgrestException: $error');
    } catch (e) {
      Logger().i('Insert ChatPin Failure');
    }
    return [];
  }

  Future<List<Map<String, dynamic>>> deleteAccount(String id) async {
    try {
      final response = await supabase.from('account').delete().eq('id', id).select();
      Logger().i(response);
      return response;
    } on PostgrestException catch (error) {
      Logger().e('PostgrestException: $error');
    } catch (e) {
      Logger().i('Delete ChatPin Failure');
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

  Future<List<Map<String, dynamic>>> getLink() async {
    try {
      final data = await supabase.from('link').select();
      Logger().i(data);
      return data;
    } on PostgrestException catch (error) {
      Logger().e('PostgrestException: $error');
    } catch (error) {
      Logger().e('Link Errr: $error');
    }
    return [];
  }
}
