import 'package:flutter/material.dart';

class VaultListsSelector extends StatelessWidget {
  const VaultListsSelector({
    @required this.vaultsClick,
    @required this.requestsClick,
    this.vaultsChecked,
    Key key,
  }) : super(key: key);
  final VoidCallback vaultsClick;
  final VoidCallback requestsClick;
  final bool vaultsChecked;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'vault-lists-selector-tag',
      child: Card(
        elevation: 16.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  bottomLeft: Radius.circular(32.0),
                ),
              ),
              onPressed: vaultsClick,
              child: AnimatedDefaultTextStyle(
                style: this.vaultsChecked != null && this.vaultsChecked
                    ? Theme.of(context).textTheme.button.copyWith(
                          fontWeight: FontWeight.bold,
                        )
                    : Theme.of(context).textTheme.button.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                duration: const Duration(milliseconds: 300),
                child: Text('Vaults'),
              ),
            ),
            Container(
              color: Colors.black,
              width: 1.0,
              height: 24.0,
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32.0),
                  bottomRight: Radius.circular(32.0),
                ),
              ),
              onPressed: requestsClick,
              child: AnimatedDefaultTextStyle(
                style: this.vaultsChecked != null && !this.vaultsChecked
                    ? Theme.of(context).textTheme.button.copyWith(
                          fontWeight: FontWeight.bold,
                        )
                    : Theme.of(context).textTheme.button.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                duration: const Duration(milliseconds: 300),
                child: Text('Requests'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
