import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {

  final IconData _iconeMenu;
  final String _textoMenu;
  final PageController _pageController;
  final int page;

  MenuDrawer(this._iconeMenu, this._textoMenu, this._pageController, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
            Navigator.of(context).pop();
            _pageController.jumpToPage(page);
        },
        child: Container(
          height: 50.0,
          child: Row(
            children: <Widget>[
              Icon(
                _iconeMenu,
                size: 32.0,
                color: Colors.black,
              ),
              SizedBox(
                width: 32.0,
              ),
              Text(
                _textoMenu,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
