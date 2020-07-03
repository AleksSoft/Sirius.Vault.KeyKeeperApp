import 'package:flutter/material.dart';

class VaultListsSelector extends StatelessWidget {
  const VaultListsSelector({
    @required this.vaultsClick,
    @required this.requestsClick,
    Key key,
  }) : super(key: key);
  final VoidCallback vaultsClick;
  final VoidCallback requestsClick;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'vault-lists-selector-tag',
      child: SizedBox(
        width: 200.0,
        height: 54.0,
        child: Card(
          elevation: 16.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                onPressed: vaultsClick,
                child: Text('Vaults'),
              ),
              Container(
                color: Colors.black,
                width: 1.0,
                height: 24.0,
              ),
              FlatButton(
                onPressed: requestsClick,
                child: Text('Requests'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
