import 'package:flutter/material.dart';
import 'package:zv/log_in/parts/pass_body.dart';

import 'mail_body.dart';

class LineWidget extends StatelessWidget {
  final String   hint;
  final String   id;
  final IconData iconData;

  const LineWidget( this.hint,  this.id,  this.iconData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 4 ),
      child:   ClipRRect(
        borderRadius: BorderRadius.circular( 20.0 ),
        child: Container(
          color: const Color.fromRGBO( 171, 177, 197, 1 ),
          child: SizedBox(
            width: 500,
            child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox( width: 15 ),
                    Icon( iconData ),
                    const SizedBox( width: 15 ),
                    SizedBox(
                      width:  300,
                      //height: 50,
                      child: 
                      ( id == 'mail'             )?
                      ( MailBody( id, hint, "" ) ):
                      ( PassBody( id, hint, "" ) ),
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
