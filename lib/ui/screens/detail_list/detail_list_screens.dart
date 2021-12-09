import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:susmatior_app/constants/padding_constants.dart';
import 'package:susmatior_app/ui/screens/detail_list/widgets/image_dialog_widget.dart';
import 'package:susmatior_app/ui/screens/widgets/appbar_widget.dart';

class DetailListScreen extends StatefulWidget {
  static const routeName = '/detail_list_screen';

  const DetailListScreen({Key? key, required this.docId}) : super(key: key);

  final String? docId;

  @override
  State<DetailListScreen> createState() => _DetailListScreenState();
}

class _DetailListScreenState extends State<DetailListScreen> {
  late SnackBar snackbarEmpty;
  late SnackBar snackbarError;

  @override
  void initState() {
    snackbarEmpty = const SnackBar(
      content: Text("Data does not exist!"),
    );
    snackbarError = const SnackBar(
      content: Text("There is something wrong!"),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference dataScams =
        FirebaseFirestore.instance.collection('data-scams');
    print("selected docId: ${widget.docId}");
    return Scaffold(
      appBar: AppBarPrimary(
        textTitle: 'Detail Report',
      ),
      body: SafeArea(
        child: FutureBuilder<DocumentSnapshot>(
          future: dataScams.doc(widget.docId).get(),
          builder: (context, snapshot) {
            if (snapshot.hasData && !snapshot.data!.exists) {
              Fluttertoast.showToast(
                  msg: "Data does not exist!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.grey.withOpacity(0.75),
                  textColor: Colors.white,
                  timeInSecForIosWeb: 3,
                  fontSize: 16.0);
              return SizedBox();
            } else if (snapshot.hasError) {
              Fluttertoast.showToast(
                  msg: "There is an error occured!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.grey.withOpacity(0.75),
                  textColor: Colors.white,
                  timeInSecForIosWeb: 3,
                  fontSize: 16.0);
              return SizedBox();
            } else if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: padding_16,
                    left: padding_16,
                    right: padding_16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone Number',
                        style: GoogleFonts.montserrat(
                          fontSize: 18.0,
                          color: Color(0xFF2F2E41),
                          fontWeight: FontWeight.w500,
                          textStyle: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      const SizedBox(height: padding_8),
                      Text(
                        data['pnumber'],
                        style: GoogleFonts.montserrat(
                          fontSize: 18.0,
                          color: Color(0xFF2F2E41),
                          fontWeight: FontWeight.w400,
                          textStyle: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      const SizedBox(
                        height: padding_16,
                      ),
                      Text(
                        'Descriptions',
                        style: GoogleFonts.montserrat(
                          fontSize: 18.0,
                          color: Color(0xFF2F2E41),
                          fontWeight: FontWeight.w500,
                          textStyle: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      const SizedBox(
                        height: padding_8,
                      ),
                      Text(
                        data['description'],
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.montserrat(
                          fontSize: 18.0,
                          color: Color(0xFF2F2E41),
                          fontWeight: FontWeight.w400,
                          height: 1.7,
                          textStyle: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      const SizedBox(
                        height: padding_16,
                      ),
                      Text(
                        'Status',
                        style: GoogleFonts.montserrat(
                          fontSize: 18.0,
                          color: Color(0xFF2F2E41),
                          fontWeight: FontWeight.w500,
                          textStyle: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      const SizedBox(
                        height: padding_8,
                      ),
                      Text(
                        data['status'],
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.montserrat(
                          fontSize: 18.0,
                          color: Color(0xFF2F2E41),
                          fontWeight: FontWeight.w400,
                          textStyle: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      const SizedBox(
                        height: padding_16,
                      ),
                      Text(
                        'Evidence Report',
                        style: GoogleFonts.montserrat(
                          fontSize: 18.0,
                          color: Color(0xFF2F2E41),
                          fontWeight: FontWeight.w500,
                          textStyle: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      const SizedBox(
                        height: padding_8,
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAlias,
                            child: GestureDetector(
                                onTap: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (_) => ImageDialog(
                                      assetName: data['image'],
                                    ),
                                  );
                                },
                                child: Image.network(
                                  data['image'],
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: padding_16,
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
