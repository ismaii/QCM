<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=" %>
<%@ taglib prefix="sss" uri = "http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Espace employé</title>
		<link type="text/css" rel="stylesheet" href="inc/style.css" />
	</head>
	<body>
		<!---------------- Entête: espace .... ----------------------->
		<!---------------- Message bonjour nom prenom .... ----------------------->
		<div id="container">
			<div id="infos-connexion" >
				<div id="infos-user" >
					<span >${espace}, ${bonjour}</span>
				</div>
				<div class="quitter">	
					<!---------------- Se déconnecter ----------------------->
					<form action="seDeconnecter.aspx" method="post">
			        	<button type="submit" style="width: 100%;height: 100%;background-color: #3E3E3E;">Quitter</button>
			        </form>		
				</div>
			</div>
			<div id="entete">
				<div id="logo">				
				</div>
				<div class="sous-menu" >	
					<!---------------- Ajouter Qcms ----------------------->
					<form action="vueEmployeAjouterQcm.aspx" method="post">
			        	<button type="submit" style="width: 100%;height: 100%;background-color: #000 ;">Ajouter Qcm</button>
			        </form>	
				</div>
				<div class="sous-menu" >	
					<!---------------- Consulter Qcms ----------------------->
					<form action="vueEmployeListeQcm.aspx" method="post">
			        	<button type="submit" style="width: 100%;height: 100%;background-color: #515151 ;">Liste Qcm</button>
			        </form>	
				</div>
				<div class="sous-menu" >	
					<!---------------- Consulter Qcms Internautes ----------------------->
					<form action="vueEmployeModifierQcms.aspx" method="post">
			        	<button type="submit" style="width: 100%;height: 100%;background-color: #8b8b8b;">Modifier Qcms</button>
			        </form>		
				</div>
				<div class="sous-menu" >	
					<!---------------- Consulter Qcms Internautes ----------------------->
					<form action="vueEmployeQcmInternaute.aspx" method="post">
			        	<button type="submit" style="width: 100%;height: 100%;background-color: #5B5B5B;">Qcms Internautes</button>
			        </form>		
				</div>
				
			</div> <!-- fin entete -->
			
			<!---------------- Liste QCM ----------------------->
			<div class="box">
				<div class="titre">	
					<div class="titre-trapeze">	
						<h1>Liste QCM</h1>	
					</div>			    		
				</div>
				<div class="sous-box">	
					<!-- Liste qcm -->	
					<sss:forEach items="${listeQcms}" var = "o">	
						<fieldset>
					    <legend Style="margin:auto;">
					    	<label for="idQcm" Style="float:none;">IdQcm ${ o.id }</label>
					    </legend>	
		                <br />
		                <div class="infos-qcm">
			                <label for="idQcm">Catégorie </label>
							<label for="idQcm">${ o.categorie } </label>
			                <br />
			                <label for="idQcm">Libellé </label>
							<label for="idQcm">${ o.libelle } </label>
			                <br />
			                <label for="idQcm">Crée le:  </label>
							<label for="idQcm" style=" width: 52%;">${ o.dateCreation } </label>		                
			                <br />
			                <label for="etat">Etat:  </label>
							<label for="idQcm">${o.etat } </label>
							<br>
							<label for="etat">Message Responsable:  </label>
							<label for="idQcm">${o.messageResponsable } </label>
						</div>
						<ul class="forms-liste-qcm">
		                  	<li>
		                  	<form action="supprimerQCM.aspx" method="post">
		                  		<input type="hidden" name="idQcm" value = "${o.id}" />
		                  		<button type="submit" class="btn-valider" name="supprimer" >Supprimer ce QCM</button> 
		                  	</form>
		                  	</li>
		                  	<li>
		                  	<form action="vueModifierQcm.aspx" method="post">							
		                  		<input type="hidden" name="idQcm" value = "${o.id}" />
		                  		<button type="submit" class="btn-valider" name="modifier" value="modifier">Modifier</button> 
		                  	</form>
		                  	</li>
		                </ul>
						<br>
						<br>
						<br />
		                <br />
		                <div class="line-separatrice"></div>
		                <div class="line-separatrice"></div>
		                <sss:forEach items="${o.questionnaires}" var = "oo">	                	
							<div class="line-separatrice"></div>
							<br />
							<div class="infos-questionnaire">
			                	<label for="idQcm">Id Question : </label>
			                	<label for="idQcm">${oo.id} </label>
				                <br />
				                <label for="idQcm">Question : </label>
								<label for="idQcm">${oo.question} </label>
				                <br />
				                <sss:forEach items="${oo.choices}" var = "ooo">
					                <label for="idQcm">${ooo.label}(${ooo.br})   </label>
					                <label for="idQcm">${ooo.choix} </label>
									<br />
								</sss:forEach>
							</div>		                  	
		                  	<br/>		
		                  	<ul class="forms-liste-qcm" style="margin-bottom: 13px;">
			                  	<li>
			                  	<form action="supprimerQUESTIONNAIRE.aspx" method="post">
			                  		<input type="hidden" name="idQcm" value = "${o.id}" />
			                  		<input type="hidden" name="idQuestionnaire" value = "${oo.id}" />
			                  		<button type="submit" class="btn-valider" name="supprimer" >Supprimer ce Questionnaire</button> 
			                  	</form>
			                  	</li>
			                  	<li>
			                  	<form action="vueModifierQuestionnaire.aspx" method="post">							
			                  		<input type="hidden" name="idQcm" value = "${o.id}" />
			                  		<input type="hidden" name="idQuestionnaire" value = "${oo.id}" />
			                  		<button type="submit" class="btn-valider" name="modifier" value="modifier">Modifier</button> 
			                  	</form>
			                  	</li>
			                </ul>                  	
	                  	</sss:forEach>
						</fieldset>
					</sss:forEach>
				</div>
				
			</div> <!-- fin box -->	
		</div>    <!-- fin container -->
	</body>
</html>