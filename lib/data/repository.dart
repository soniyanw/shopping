import '../core/services/notification_service.dart';
import 'notification_service_impl.dart';

class AppRepository {

  late final NotificationService notificationService;

  Future<void> init() async{
    notificationService = NotificationServiceImpl();
  }

}
