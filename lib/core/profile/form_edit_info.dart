import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class form_edit_info extends StatefulWidget {
  form_edit_info({Key? key}) : super(key: key);
  @override
  State<form_edit_info> createState() => _form_edit_infoState();
}

TextEditingController _nomprenomController = new TextEditingController();
TextEditingController date = TextEditingController();
TextEditingController _numtelController = new TextEditingController();


class _form_edit_infoState extends State<form_edit_info> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
        return Form(
          key: _formKey,
          child:Column(
            children: [
              Container(
                width: 341,
                child: TextFormField(
                  controller: _nomprenomController,
                  keyboardType: TextInputType.name,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Zá-úÁ-ÚwÀ-Üà-øoù-ÿŒœ ]+|\s')),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Nom et Prénom',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE6E6E6)),
                    ),


                    labelStyle:GoogleFonts.poppins(
                      textStyle:TextStyle(
                          color: Color(0xFFC0C2CA),
                          fontWeight: FontWeight.w400,
                          fontSize:12
                      ),

                    ),
                  ),
   /* validator: (value) {
    if (!RegExp(r'^[a-z A-Z]+$')
        .hasMatch(value!)) {
    return 'nom invalide';
    }
    if (value.isEmpty) {
    return 'entrer votre nom et prénom';
    }}*/

                ),
              ),
              SizedBox(
                height:20,
              ),
              Container(
                width: 341,
                child: TextFormField(
                  controller: date,
                  readOnly: true,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE6E6E6)),
                    ),
                    labelText: 'Date de naissance',
                    labelStyle:GoogleFonts.poppins(
                      textStyle:TextStyle(
                          color: Color(0xFFC0C2CA),
                          fontWeight: FontWeight.w400,
                          fontSize:12
                      ),
                    ),
                  ),
                   onTap: () async {
                     DateTime? pickedDate = await showDatePicker(
                         context: context,
                         initialDate: DateTime.now(),
                         firstDate: DateTime(2000),
                         //DateTime.now() - not to allow to choose before today.
                         lastDate: (DateTime.now())
                     );
    if(pickedDate != null ){
    print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
    print(formattedDate); //formatted date output using intl package =>  2021-03-16
    //you can implement different kind of Date Format here according to your requirement

    setState(() {
    date.text = formattedDate; //set output date to TextField value.
    });
    }else{
    print("Date is not selected");
    }
    },

                ),

              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 341,
                child: TextFormField(
                  maxLength: 8,
                  maxLengthEnforced: true,
                  controller: _numtelController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE6E6E6)),
                    ),
                    labelText: 'Numero de tèléphone',
                    labelStyle:GoogleFonts.poppins(
                      textStyle:TextStyle(
                          color: Color(0xFFC0C2CA),
                          fontWeight: FontWeight.w400,
                          fontSize:12
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

  }
}
