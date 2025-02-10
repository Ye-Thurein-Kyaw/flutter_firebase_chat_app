import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../network/api_service.dart';
import '../../auth/provider/auth_service.dart';
import '../model/message_model.dart';

class ChatProvider {
  final _apiService = ApiService();
  final _autSerVice = AuthService();
  MessageModel _messageModel = MessageModel(
    senderID: '',
    senderEmail: '',
    receverID: '',
    message: '',
    timestamp: Timestamp.now(),
  );
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _apiService.getCollectionStream('Users');
  }

  Future<void> sendMessage({required String message, required String receverID}) async {
    final String currentUserId = _autSerVice.getCurrentUser()!.uid;
    final String senderEmail = _autSerVice.getCurrentUser()!.email!;
    final Timestamp timestamp = Timestamp.now();
    _messageModel = MessageModel(
      senderID: currentUserId,
      senderEmail: senderEmail,
      receverID: receverID,
      message: message,
      timestamp: timestamp,
    );

    List<String> ids = [currentUserId, receverID];
    ids.sort();
    String chatRoomId = ids.join('_');

    await _apiService.firestore.collection('chat_rooms').doc(chatRoomId).collection('messages').add(_messageModel.toMap());
  }

  Stream<QuerySnapshot> getMessage(String userID, otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomId = ids.join('_');

    return _apiService.firestore.collection('chat_rooms').doc(chatRoomId).collection('messages').orderBy('timestamp', descending: false).snapshots();
  }
}
