import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:susmatior_app/constants/padding_constants.dart';
import 'package:susmatior_app/ui/screens/detail_list/widgets/image_dialog_widget.dart';
import 'package:susmatior_app/ui/screens/widgets/appbar_widget.dart';

class DetailListScreen extends StatelessWidget {
  static const routeName = '/detail_list_screen';

  const DetailListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        textTitle: 'Detail Report',
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraint.maxHeight,
                ),
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
                        '081234567891',
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
                        'Telephone scammers try to steal your money or personal information. Scams may come through phone calls from real people, robocalls, or text messages. Callers often make false promises, such as opportunities to buy products, invest your money, or receive free product trials. They may also offer you money through free grants and lotteries.',
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
                        'Scam',
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
                                    assetName: 'assets/images/img_sample.jpg',
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/images/img_sample.jpg',
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                              ),
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAlias,
                            child: GestureDetector(
                              onTap: () async {
                                await showDialog(
                                  context: context,
                                  builder: (_) => ImageDialog(
                                    assetName: 'assets/images/img_sample.jpg',
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/images/img_sample.jpg',
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                              ),
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAlias,
                            child: GestureDetector(
                              onTap: () async {
                                await showDialog(
                                  context: context,
                                  builder: (_) => ImageDialog(
                                    assetName: 'assets/images/img_sample.jpg',
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/images/img_sample.jpg',
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: padding_16,
                      ),
                      Text(
                        'Rapporteur',
                        style: GoogleFonts.montserrat(
                          fontSize: 18.0,
                          color: const Color(0xFF2F2E41),
                          fontWeight: FontWeight.w500,
                          textStyle: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      const SizedBox(
                        height: padding_8,
                      ),
                      Text(
                        'John Doe',
                        style: GoogleFonts.montserrat(
                          fontSize: 18.0,
                          color: const Color(0xFF2F2E41),
                          fontWeight: FontWeight.w400,
                          textStyle: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      const SizedBox(
                        height: padding_16,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
