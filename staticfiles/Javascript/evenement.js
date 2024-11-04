document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('sport-select').addEventListener('change', function() {
        var selectedSport = this.value;
        document.querySelectorAll('.carte').forEach(function(carte) {
            if (selectedSport === '' || carte.getAttribute('data-sport-id') ===
            selectedSport) {
                carte.style.display ='block';
            } else {
                carte.style.display ='none';
            }
        });
    });

    //Fonction pour ajouter un événement au panier
    function ajouterAuPanier(offreId, offreTitre, sportNom, offreDate) {
        var typeOffreSelect = document.getElementById('type-offre-' + offreId);
        var selectedTypeOffre = typeOffreSelect.value;

        if (selectedTypeOffre) {
            var panierList = document.getElementById('panier-liste');
            if (panierList) {
                var billets = JSON.parse(localStorage.getItem('panier')) || [];
                var billet = {
                    offreId: offreId,
                    offreTitre: offreTitre,
                    sportNom: sportNom,
                    date: offreDate,
                    typeOffre: selectedTypeOffre,
                };
                billets.push(billet);
                localStorage.setItem('panier', JSON.stringify(billets));

                var li = document.createElement('li');
                li.setAttribute('data-offre-id', offreId);
                li.setAttribute('data-type-offre', selectedTypeOffre);
                li.textContent = offreTitre + ' - ' + sportNom + 
                ' - ' + offreDate + ' - ' + selectedTypeOffre;
                
                var removeButton = document.createElement('button');
                removeButton.textContent = 'Supprimer';
                removeButton.style.marginLeft = '10px';
                removeButton.onclick = function() {
                    supprimerDuPanier(li, billet);
                };

                li.appendChild(removeButton);
                panierList.appendChild(li);
                updateTotal();
            } else {
                console.error('Panier non trouvé.');
            }
        } else {
            alert('Veuillez sélectionner un type d\'offre.');
        }
    }
    //Fonction pour supprimer un événement du panier
    function supprimerDuPanier(element, billet) {
        var billets = JSON.parse(localStorage.getItem('panier')) || [];
        billets =billets.filter(function(b) {
            return !(b.offreId === billet.offreId && b.date === billet.date && 
                b.typeOffre === billet.typeOffre);
        });
        localStorage.setItem('panier', JSON.stringify(billets));        
        element.remove();
        updateTotal();
    }
    //Fonction pour mettre à jour le total du panier
    function updateTotal() {
        var total = 0;
        var panierList = document.getElementById('panier-liste');
        if (panierList) {
            var items = panierList.getElementsByTagName('li');
            total = items.length;
            document.getElementById('panier-total').textContent = total;
        } else {
            console.error('Panier non trouvé.')
        }
    }

    window.ajouterAuPanier = ajouterAuPanier;
    //Charger le panier depuis le stockage local si présent
    if (document.getElementById('panier-liste')) {
        var billets = JSON.parse(localStorage.getItem('panier')) || []
        billets.forEach(function(billet) {
            var li = document.createElement('li');
            li.setAttribute('data-offre-id', billet.offreId);
            li.setAttribute('data-date', billet.date);
            li.textContent = billet.offreTitre + ' - ' + billet.sportNom + ' - ' + billet.date + ' - ' + billet.typeOffre;

            var removeButton = document.createElement('button');
            removeButton.textContent = 'Supprimer';
            removeButton.style.marginLeft = '10px';
            removeButton.onclick = function() {
                supprimerDuPanier(li, billet);
            };

            li.appendChild(removeButton);
            document.getElementById('panier-liste').appendChild(li);
        });
        updateTotal(); 
        
    }
    //Fonction pour valider la commande
    window.validerCommande = function() {
        alert('Afin de terminer votre achat, merci de bien vouloir vous connecter !');
    };

    
});



