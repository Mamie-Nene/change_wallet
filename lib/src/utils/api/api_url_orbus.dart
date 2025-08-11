

class ApiUrlOrbus{

  //              ---------------------- Const Var ----------------------
  static const String baseUrlDIPA='https://orbuspoles.orbus.sn/apidipa';
  static const String baseUrPreprodlSPPOT='https://orbus-preprod.gainde2000.sn/apisppot';
  static const String baseUrlSPOT='https://orbuspoles.orbus.sn/apisppot';
  static const String baseUrlOrbusDashboard='https://orbuspoles.orbus.sn/apidashboard';
  //            ------------------------- SPPOT  ------------------------------

  String getInformationPoleByCodeFamille= '$baseUrlSPOT/listetatpolebycode';

  String getAllEtatPoleByMonthAndYear= '$baseUrlSPOT/listetatpole';

  String getAllEtatOrbus= '$baseUrlSPOT/listetat';

  String getListDossierOrbus= '$baseUrlSPOT/listedossier1';

//            ------------------------- DIPA  ------------------------------
  String getEtatDossierDipaSoumis= '$baseUrlDIPA/joindres';

  String getEtatDossierDipaTraites= '$baseUrlDIPA/dipatraites';

  String getEtatDossierDipaEntreDateComparee= '$baseUrlDIPA/joindresannee';

  String getCADipaEntreDateComparee= '$baseUrlDIPA/prixTwoyears';

  String getTendanceEntreDateDossierDipa= '$baseUrlDIPA/tendanceannee';

  String getEstimationImportsDipa= '$baseUrlDIPA/sommePrixTotal';

  String getEstimationImportsArticlesDipa= '$baseUrlDIPA/listprixbyHcode';

  String getDemandeSoumisArticlesDipa= '$baseUrlDIPA/listDemandesNumeroTarif';
  String getDemandeTraitesArticlesDipa= '$baseUrlDIPA/listDemandesNumeroTariftraite';

  //            ------------------------- Orbus dashboard  ------------------------------

        //     ----------------------> Dossier par jour  --------

  String getNbreDossierParJourMoisEnCoursOrbusDashboard='$baseUrlOrbusDashboard/GetNombreDossierParJourDuMoisEnCours';
  String getNombreDossierParJourDuMoisOrbusDashboard='$baseUrlOrbusDashboard/GetNombreDossierParJourDuMois';

  String getTendanceEvolutionJournaliereFor2YearOrbusDashboard='$baseUrlOrbusDashboard/GetNombreDossierParJourDePeriode';

        //  ----------------------> Dossier par mois Var -------------------

  String getPerformanceCompareeFor3YearsOrbusDashboard='$baseUrlOrbusDashboard/GetNombreDossierPourTroisAnneesParMois';
  String getPerformanceCompareeFor2YearsOrbusDashboard='$baseUrlOrbusDashboard/GetNombreDossierPourDeuxAnneesParMois';
  String getPerformanceCompareeForYearOrbusDashboard='$baseUrlOrbusDashboard/GetNombreDossierParMois';
  String getTendanceEvolutionMensuelFor3YearOrbusDashboard='$baseUrlOrbusDashboard/GetNombreDossierPourTroisAnneesParMois';

  //              ---------------------- Statistique Var ----------------------

  String getStatistiqueFor2yearsOrbusDashboard='$baseUrlOrbusDashboard/GetStatRecapPourTroisAnnnee';


}