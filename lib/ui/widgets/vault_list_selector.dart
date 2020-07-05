import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class VaultListsSelector extends StatelessWidget {
  const VaultListsSelector({
    @required this.vaultsClick,
    @required this.requestsClick,
    this.vaultsChecked,
    this.requestsCount,
    Key key,
  }) : super(key: key);
  final VoidCallback vaultsClick;
  final VoidCallback requestsClick;
  final bool vaultsChecked;
  final int requestsCount;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.button;
    return Hero(
      tag: 'vault-lists-selector-tag',
      child: SizedBox(
        height: 56.0,
        child: Card(
          elevation: 16.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: vaultsClick,
                  child: AnimatedDefaultTextStyle(
                    style: this.vaultsChecked != null && this.vaultsChecked
                        ? textStyle.copyWith(fontWeight: FontWeight.bold)
                        : textStyle.copyWith(fontWeight: FontWeight.normal),
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
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: requestsClick,
                  child: AnimatedDefaultTextStyle(
                    style: this.vaultsChecked != null && !this.vaultsChecked
                        ? textStyle.copyWith(fontWeight: FontWeight.bold)
                        : textStyle.copyWith(fontWeight: FontWeight.normal),
                    duration: const Duration(milliseconds: 300),
                    child: Badge(
                      elevation: 0.0,
                      badgeColor: Colors.transparent,
                      badgeContent: Text('$requestsCount'),
                      showBadge: requestsCount != null && requestsCount != 0,
                      animationDuration: const Duration(milliseconds: 150),
                      animationType: BadgeAnimationType.fade,
                      child: Text('Requests'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
