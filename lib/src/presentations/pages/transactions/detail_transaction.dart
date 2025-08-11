
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../data/local/pdf_api.dart';
import '../../../domain/local/Invoice_Info /Customer.dart';
import '../../../domain/local/Invoice_Info /Invoice.dart';
import '../../../domain/local/Invoice_Info /Supplier.dart';
import '../../widgets/pdf_invoice_widget.dart';
import '/src/utils/consts/app_specifications/allDirectories.dart';

class DetailTransaction extends StatefulWidget {
  const DetailTransaction({Key? key}) : super(key: key);

  @override
  State<DetailTransaction> createState() => _DetailTransactionState();
}

class _DetailTransactionState extends State<DetailTransaction> {

  String refTransaction ="EWALLET567890987654";

  Future<void> _downloadInvoice( BuildContext context) async {
    //Future<void> _downloadInvoice(CurrentUser user,PanierFromGateway resultTransaction, BuildContext context) async {
    final date = DateTime.now();
    // final dueDate = date.add(Duration(days: 7));

    final invoice = Invoice(
      supplier: const Supplier(
        name: 'UCP Gainde2000',
        address: 'Point E, Dakar, Sénégal',
        paymentInfo: 'https://www.orbuspay.com',
      ),
      customer:  const Customer(
        name: "MMBA",
        address: "Adresse non spécifiée",
        //address: user.firstName==""?"Adresse non spécifiée":user.firstName,
      ),
      info: InvoiceInfo(
        date: date,
        description: 'Facture générée après paiement des services du LPG',
        number: 'EWALLET.${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}-${DateTime.now().millisecond}',
        moyenPaiement:"Client encompte",
        //moyenPaiement: resultTransaction.paiementMode!,
      ),
      items: [
        InvoiceItem(
          service: "Orbus Infinity",
          date:DateTime.now(),
          //date:DateTime.parse(resultTransaction.datePaiement!),
          refFacture: "090420240987",
          // refFacture: resultTransaction.referencePanier,
          montant:20000 ,
          // montant:double.parse(resultTransaction.montantFacture) ,
        ),
      ],


    );
    // for generated our invoice(pdf document) we have to put an invoice in our generated methode
    // our invoice will hold all the data of our pdf document
    final pdfFile = await PdfInvoiceWidget.generate(invoice);
    //so the generated pdf file are nedded to be storen inside of our file systems file
    //we need to open our file after it has created
    PdfApi.openFile(pdfFile);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.mainAppColor,// Colors.grey.shade200,
      body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Détails de la transaction',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(24.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _transactionHeader(typeTransaction: true),
                              _informationCard(context),
                              _referenceCard(),
                              _recuCard()
                            ],
                          )
                      )
                  )
              ),

            ],
          ),
    );
  }

  Widget _appBar(){
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),

          SizedBox(width:  AppDimensions.sizeboxWidth40,),

          const Text('',
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Gill Sans",
            ),
          )
        ],
      ),
    );
  }

  Widget _transactionHeader({required bool typeTransaction}) {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width/1.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text("100.000 F CFA",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      fontFamily: "Georgia"
                  ),
                ),

                SizedBox(height:  AppDimensions.sizeboxHeight10,),

                const Text("Type : Facture",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily:  "serif"
                    )
                ),

                SizedBox(height:  AppDimensions.sizeboxHeight5,),

                const Text("Paiement de facture Orbus Infinity sous le compte principal",
                    style: TextStyle(
                      height: 1.3,
                      color: Colors.black,
                      fontSize: 13,
                    )),
                const SizedBox(height: 7,),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: const Text("Rechargement",style: TextStyle(color: Colors.green,fontSize: 10),),
                )
              ],
            ),
          ),
          Image.asset(AppImages.LOGO_GAINDE,scale: 8,)
          // typeTransaction?  SvgPicture.asset("asset/images/credit.svg"):SvgPicture.asset("asset/images/bill.svg")
        ],
      );
  }

  Widget _informationCard(BuildContext context){
    List<String> nomChamps=["Date & Heure", "N° du Dossier", "Connaissement","Statut"];
    List<String> values=["23/04/2024 16:27", "GUDE23032024RX","MEDUZL567890","Effectuée"];


    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: [

          SizedBox(height: MediaQuery.of(context).size.height/4,
            child: ListView.separated(
                itemCount: nomChamps.length,
                itemBuilder: (BuildContext context, int index){
                  return  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(nomChamps[index],style: TextStyle(color:AppColors.mainAppColor,fontFamily: "serif",fontSize: 18)) ,//Colors.black38
                      Text(values[index],style: TextStyle(fontFamily: index==3?null:"Gill Sans",color: index==3?Colors.green.shade300:null,fontSize: 16))
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index){return SizedBox(height:  AppDimensions.sizeboxHeight15,);}
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text("Montant",style: TextStyle(color:AppColors.mainAppColor ,fontFamily: "serif",fontSize: 18)) ,//Colors.black38
              Text("100.000 F CFA",style: TextStyle(fontSize: 18))
            ],
          ),
        ],
      ),
    );
  }
  /*
  *   Widget _informationCard(){
    return Container(
      margin: EdgeInsets.fromLTRB( AppDimensions.sizeboxWidth15,  AppDimensions.sizeboxHeight25, AppDimensions.sizeboxWidth5,  AppDimensions.sizeboxHeight10),
      padding: EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth15,  AppDimensions.sizeboxHeight20, AppDimensions.sizeboxWidth15,  AppDimensions.sizeboxHeight20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(

        children: [

          _rowForInformations(
            nomChamps: "Date & heure",
            value: "23/04/2024 16:27"
          ),

          _rowForInformations(
              nomChamps:"N° du Dossier",
              value:"GUDE23032024RX"
          ),

          _rowForInformations(
              nomChamps:"Connaissement",
              value:"MEDUZL567890"
          ),

          _rowForInformations(
              nomChamps:"Statut",
              value:"Effectuée"
          ),

          SizedBox(height:  AppDimensions.sizeboxHeight15,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  const [
              Text("Montant",style: TextStyle(color: Colors.black38,fontFamily: "serif",fontSize: 18)) ,
              Text("100.000 F CFA",style: TextStyle(fontSize: 18))
            ],
          ),
        ],
      ),
    );
  }*/

  Widget _referenceCard(){
    return Container(
     decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [//grey
              const Text("Référence",style: TextStyle(color: Colors.black38,fontFamily: "serif",fontSize: 19)) ,

              SizedBox(height:  AppDimensions.sizeboxHeight10,),

              Text(refTransaction,style: TextStyle(fontFamily: "Gill Sans",fontSize: 19,fontWeight: FontWeight.w300))
            ],
          ),

          IconButton(
              onPressed: (){Clipboard.setData(ClipboardData(text:refTransaction ));},
              icon: Icon(Icons.copy,color: AppColors.mainAppColor,))

        ],
      ),
    );
  }

  Widget _recuCard(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          const Text("Reçu",style: TextStyle(color: Colors.grey)) ,
          Row(
            children: [
              Icon(Icons.download_rounded,color: AppColors.mainAppColor) ,
              TextButton(
                  onPressed:(){_downloadInvoice(context);},
                  child: Text("Télécharger",
                      style: TextStyle(color: AppColors.mainAppColor)
                  )
              ),
            ],
          ) ,
        ],
      ),
    );
  }

}