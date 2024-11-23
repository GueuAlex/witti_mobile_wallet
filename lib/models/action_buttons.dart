import '../screens/convert/convert_screen.dart';
import '../screens/gift/gift_screen.dart';
import '../screens/qr_code/qrcode_screen.dart';
import '../screens/request/request_screen.dart';
import '../screens/send/send_screen.dart';

class ActionButton {
  final String title;
  final String svg;
  final String route;

  ActionButton({
    required this.title,
    required this.svg,
    required this.route,
  });

  static List<ActionButton> buttons = [
    ActionButton(
      title: 'Convert',
      svg: 'assets/icon/convertir-des-formes.svg',
      route: ConvertScreen.routeName,
    ),
    ActionButton(
      title: 'Envoyer',
      svg: 'assets/icon/envoyer-de-largent.svg',
      route: SendScreen.routeName,
    ),
    ActionButton(
      title: 'Recevoir',
      svg: 'assets/icon/recevoir-de-largent.svg',
      route: RequestScreen.routeName,
    ),
    ActionButton(
      title: 'Bons',
      svg: 'assets/icon/avantages-du-coffret-cadeau.svg',
      route: GiftScreen.routeName,
    ),
    ActionButton(
      title: 'Scan QR',
      svg: 'assets/icon/qr.svg',
      route: QrcodeScreen.routeName,
    ),
    /*  ActionButton(
      title: 'More',
      svg: 'assets/icon/menu3.svg',
    ), */
  ];
}
