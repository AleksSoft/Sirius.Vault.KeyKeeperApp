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

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          backgroundColor: _.secured ? Colors.grey[900] : Colors.white,
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 16,
                  right: 16,
                  child: FloatingActionButton(
                    onPressed: () {
                      final RenderBox box = context.findRenderObject();
                      Share.share(
                        _.secured ? _.publicKey : _.idKey,
                        sharePositionOrigin:
                            box.localToGlobal(Offset.zero) & box.size,
                      );
                    },
                    child: Icon(
                      Icons.share,
                      color: _.secured ? Colors.white : Colors.black,
                    ),
                    backgroundColor: _.secured ? Colors.black : Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Visibility(
                    visible: !_.secured,
                    child: VaultListsSelector(
                      vaultsClick: () => _.openVaultLists(vaults: true),
                      requestsClick: () => _.openVaultLists(vaults: false),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _.idKeyEmpty ? 0.0 : 1.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          _.secured ? 'Public Key' : 'ID Key',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                fontWeight: FontWeight.bold,
                                color: _.secured ? Colors.white : Colors.black,
                              ),
                        ),
                        SizedBox(height: 24.0),
                        FlipCard(
                          direction: FlipDirection.VERTICAL,
                          onFlipDone: (value) => _.secured = !value,
                          front: Card(
                            elevation: 16.0,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: QrImage(
                                data: _.idKey,
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
                              child: AnimatedSwitcher(
                                duration: Duration(milliseconds: 300),
                                child: _.showPublic
                                    ? QrImage(
                                        data: _.publicKey,
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
                        SizedBox(height: 24.0),
                        Text(
                          _.secured
                              ? 'Do not sow this to everyone!'
                              : 'Tap QR code to view Public Key',
                          style: Theme.of(context).textTheme.caption.apply(
                                color:
                                    _.secured ? Colors.white24 : Colors.black26,
                              ),
                        ),
                        SizedBox(height: 24.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
