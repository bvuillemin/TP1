package controle;

import meserreurs.MonException;
import metier.Stage;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/Controleur")
public class Controleur extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String ACTION_TYPE = "action";
    private static final String SAISIE_STAGE = "saisieStage";
    private static final String AFFICHER_STAGE = "afficheStage";
    private static final String RECHERCHER_STAGE = "rechercheStage";
    private static final String CHERCHER_STAGE = "chercheStage";
    private static final String AJOUT_STAGE = "ajoutStage";
    private static final String MODIFIER_STAGE = "modifierStage";
    private static final String EDITER_STAGE = "editerStage";
    private static final String SUPPRIMER_STAGE = "supprimerStage";
    private static final String SUPPRESSION_STAGE = "suppressionStage";
    private static final String ERROR_PAGE = null;

    // le format est une combinaison de MM dd yyyy avec / ou �
    // exemple dd/MM/yyyy
    public Date conversionChaineenDate(String unedate, String unformat) throws Exception {
        Date datesortie;
        // on d�finit un format de sortie
        SimpleDateFormat defFormat = new SimpleDateFormat(unformat);
        datesortie = defFormat.parse(unedate);
        return datesortie;
    }


    protected void processusTraiteRequete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, MonException, Exception {
        String actionName = request.getParameter(ACTION_TYPE);
        String destinationPage = ERROR_PAGE;
        List<Stage> listeStages = null;
        // execute l'action
        switch (actionName) {
            case SAISIE_STAGE:
                request.setAttribute("stage", new Stage());
                destinationPage = "/saisieStage.jsp";
                break;
            case AJOUT_STAGE:
                try {
                    Stage unStage = new Stage();
                    unStage.setId(request.getParameter("id"));
                    unStage.setLibelle(request.getParameter("libelle"));
                    unStage.setDatedebut(conversionChaineenDate(request.getParameter("datedebut"), "yyyy/MM/dd"));
                    unStage.setDatefin(conversionChaineenDate(request.getParameter("datefin"), "yyyy/MM/dd"));
                    unStage.setNbplaces(Integer.parseInt(request.getParameter("nbplaces")));
                    unStage.setNbinscrits(Integer.valueOf((request.getParameter("nbplaces"))).intValue());
                    unStage.setNbinscrits(Integer.valueOf((request.getParameter("nbinscrits"))).intValue());
                    unStage.insertionStage();
                    destinationPage = "/index.jsp";
                } catch (Exception e) {
                    request.setAttribute("MesErreurs", e.getMessage());
                    System.out.println(e.getMessage());
                }
                break;
            case AFFICHER_STAGE:
                try {
                    Stage unStage = new Stage();
                    request.setAttribute("affichageListe", 1);
                    listeStages = unStage.afficheStages();
                    request.setAttribute("liste", listeStages);
                    destinationPage = "/afficherStages.jsp";
                } catch (MonException e) {
                    request.setAttribute("MesErreurs", e.getMessage());
                    destinationPage = "/Erreur.jsp";

                }
                break;
            case RECHERCHER_STAGE:
                request.setAttribute("stage", new Stage());
                destinationPage = "/rechercheStage.jsp";
                break;
            case CHERCHER_STAGE:
                try {
                    Stage unStage = new Stage();
                    request.setAttribute("affichageListe", 1);
                    String a = request.getParameter("id");
                    listeStages = unStage.rechercheStages(request.getParameter("recherche"));
                    request.setAttribute("liste", listeStages);
                    request.setAttribute("resultats", request.getParameter("recherche"));
                    destinationPage = "/rechercheStage.jsp";
                } catch (MonException e) {
                    request.setAttribute("MesErreurs", e.getMessage());
                    destinationPage = "/Erreur.jsp";
                }
                break;
            case SUPPRIMER_STAGE:
                try {
                    Stage unStage = new Stage();
                    request.setAttribute("affichageListe", 1);
                    listeStages = unStage.afficheStages();
                    request.setAttribute("liste", listeStages);
                    destinationPage = "/supprimerStages.jsp";

                } catch (MonException e) {
                    request.setAttribute("MesErreurs", e.getMessage());
                    destinationPage = "/Erreur.jsp";
                }break;
            case SUPPRESSION_STAGE:
                try {
                    Stage unStage = new Stage();
                    unStage.suppressionStage(request.getParameter("id"));
                    destinationPage = "/afficherStages.jsp";
                } catch (MonException e) {
                    request.setAttribute("MesErreurs", e.getMessage());
                    destinationPage = "/Erreur.jsp";
                }break;
            case MODIFIER_STAGE:
                request.setAttribute("id", request.getParameter("id"));
                request.setAttribute("libelle", request.getParameter("libelle"));
                request.setAttribute("datedebut", request.getParameter("datedebut"));
                request.setAttribute("datefin", request.getParameter("datefin"));
                request.setAttribute("nbplaces", request.getParameter("nbplaces"));
                request.setAttribute("nbinscrits", request.getParameter("nbinscrits"));
                destinationPage = "/modifierStage.jsp";
                break;
            case EDITER_STAGE:
                try {
                    Stage unStage = new Stage();
                    unStage.setId(request.getParameter("id"));
                    unStage.setLibelle(request.getParameter("libelle"));
                    unStage.setDatedebut(conversionChaineenDate(request.getParameter("datedebut"), "yyyy/MM/dd"));
                    unStage.setDatefin(conversionChaineenDate(request.getParameter("datefin"), "yyyy/MM/dd"));
                    unStage.setNbplaces(Integer.parseInt(request.getParameter("nbplaces")));
                    unStage.setNbinscrits(Integer.valueOf((request.getParameter("nbplaces"))).intValue());
                    unStage.setNbinscrits(Integer.valueOf((request.getParameter("nbinscrits"))).intValue());
                    unStage.modifierStage(request.getParameter("id"));
                    destinationPage = "/afficherStages.jsp";
                } catch (MonException e) {
                    request.setAttribute("MesErreurs", e.getMessage());
                    destinationPage = "/Erreur.jsp";
                }


        }      // Redirection vers la page jsp appropriee
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(destinationPage);
        dispatcher.forward(request, response);
    }

    //L�appel de cette proc�dure se fait avec :

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        try {
            processusTraiteRequete(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        try {
            processusTraiteRequete(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            ;
        }
    }
}