import 'package:KeyKeeperApp/controller/home/home_controller.dart';
import 'package:KeyKeeperApp/ui/widgets/vault_list_selector.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';
// import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  static final String route = '/home';

  final HomeController c = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    print('\nHOME_BUILD');
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Obx(
              () => AnimatedContainer(
                duration: Duration(milliseconds: 300),
                color: c.secured ? Colors.grey[900] : Colors.white,
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: Obx(
                () => FloatingActionButton(
                  onPressed: () => Share.share(c.key),
                  child: Icon(
                    Icons.share,
                    color: c.secured ? Colors.white : Colors.black,
                  ),
                  backgroundColor: c.secured ? Colors.black : Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: Obx(() => Visibility(
                    visible: !c.secured,
                    child: VaultListsSelector(
                      vaultsClick: () => c.openVaultLists(vaults: true),
                      requestsClick: () => c.openVaultLists(vaults: false),
                    ),
                  )),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Obx(() => Text(
                        c.secured ? 'Public Key' : 'ID Key',
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.bold,
                              color: c.secured ? Colors.white : Colors.black,
                            ),
                      )),
                  const SizedBox(height: 24.0),
                  FlipCard(
                    direction: FlipDirection.VERTICAL,
                    speed: 300,
                    onFlipDone: (value) => c.secured = !value,
                    front: Card(
                      elevation: 16.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: QrImage(
                          data: c.key,
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          version: QrVersions.auto,
                          size: 250.0,
                        ),
                      ),
                    ),
                    back: Card(
                      elevation: 16.0,
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(
                          () => AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            child: c.keyLocked
                                ? QrImage(
                                    data: c.key,
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                    version: QrVersions.auto,
                                    size: 250.0,
                                  )
                                : Container(
                                    height: 250.0,
                                    width: 250.0,
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.lock,
                                      size: 48.0,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Obx(
                    () => Text(
                      c.secured
                          ? 'Do not sow this to everyone!'
                          : 'Tap QR code to view Public Key',
                      style: Theme.of(context).textTheme.caption.apply(
                            color: c.secured ? Colors.white54 : Colors.black26,
                          ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
