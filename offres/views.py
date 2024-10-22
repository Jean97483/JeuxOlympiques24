#offres/views.py
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.views import LoginView
from django.shortcuts import render, redirect, get_object_or_404
from .models import Offre, Sport, Evenement, Panier
from django.contrib.auth.decorators import login_required
from django.urls import reverse
import qrcode
import qrcode.image.svg
from io import BytesIO
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.contrib.auth import get_user_model
from users.models import CustomUser
import uuid
from django.core.files.uploadedfile import InMemoryUploadedFile
import hashlib
from django.contrib import messages


User = get_user_model()

#Vue pour la connexion personnalisée
class CustomLoginView(LoginView):
    template_name = 'users/login.html'

def custom_logout_view(request):
    logout(request)
    return redirect(reverse('connexion'))

def accueil(request):
    return render(request, 'accueil.html')

def evenement(request):
    try:
        sports = Sport.objects.all()
        offres = Offre.objects.all()
        context = {
            'sports': sports,
            'offres': offres,
        }
        return render(request, 'evenements.html', context)
    except Exception as e:
        print(f"Erreur lors de la récupération des évènements : {e}")
        messages.error(request, "Une erreur s'est produite lors du chargement des évènements.")
        return redirect('accueil')

# Autres vues
@login_required
def panier(request):
    panier_items = Panier.objects.filter(user=request.user)
    total = sum(item.offre.prix * item.quantite for item in panier_items)
    return render(request, 'panier.html', {'panier_item': panier_items, 'total': total})

@login_required
def ajouter_au_panier(request, offre_id, evenement_id):
    offre = get_object_or_404(Offre, id=offre_id)
    evenement = get_object_or_404(Evenement, id=evenement_id)
    panier_item, created = Panier.objects.get_or_create(
        user=request.user, 
        offre=offre, 
        evenement=evenement)
    if not created:
        panier_item.quantite += 1
        panier_item.save()
    return redirect('panier')

@login_required
def simulate_payment(request):
    #Vérifie si la méthode de reqête est POST
    if request.method == 'POST':
        #Récupérer le panier de la session
        panier = request.session.get('panier', [])
        #Générer une nouvelle clé d'achat
        purchase_key = str(uuid.uuid4())

        #Récupérer l'utilisateur et concaténer la clé existante avec la nouvelle clé
        user = request.user
        final_key = user.unique_key + purchase_key

        try:
            #Génération du QR code
            qr = qrcode.QRCode(
                version=1,
                box_size=10,
                border=4,
            )
            qr.add_data(final_key)
            qr.make(fit=True)

            img = qr.make_image(fill='black', back_color='white')
            buffer = BytesIO()
            img.save(buffer, format="PNG")

            #Covertir en image utilisable par django
            qr_image = InMemoryUploadedFile(buffer, None, 'qr_code.png', 'image/png', buffer.getbuffer().nbytes, None)

            #Enregistrer le qrcode dans le profil utilisateur 
            user.qr_code.save('qr_code.png', qr_image)
            user.purchase_key = purchase_key
            user.final_key = final_key
            user.save()

            #Enregistrement des billets du panier dans la base de données
            for item in panier:
                try:
                    offre = get_object_or_404(Offre, id=item['offre_id'])
                    evenement = get_object_or_404(Evenement, id=item['evenement_id'])
                    Panier.objects.create(
                        offre=offre,
                        evenement=evenement,
                        quantite=item['quantite'],
                        type_offre=item['type_offre']
                    )
                except Offre.DoesNotExist:
                    messages.error(request, f"L'offre avec ID {item['offre_id']} n'existe pas.")
                except Evenement.DoesNotExist:
                    messages.error(request, f"L'évènement avec ID {item['evenement_id']} n'existe pas.")
            
            #Vider le panier après le paiement
            request.session['panier'] = []
            messages.success(request, "Paiement simulé avec succès ! Merci pour votre achat.")
            return render(request, 'confirmation.html', {'qr_code_url': user.qr_code.url, 'final_key': final_key})
        except Exception as e:
            print(f"Erreur lors de la simulation de paiement : {e}")
            messages.error(request, "Une erreur s'est produite lors de la simulation du paiement.")
            return redirect('panier')
    return redirect('panier')
    
@login_required
def confirmation_view(request):
    user = request.user
    #initialisation du faite que final_key est la concaténation des clés existantes
    if user.purchase_key:
        final_key = hashlib.sha256(f'{user.unique_key}{user.purchase_key}'.encode()).hexdigest()
    else:
        final_key = user.unique_key

    user.final_key = final_key
    user.save()


    context = {
        'final_key': user.final_key,
        'user': user,
        'first_name': user.first_name,
        'last_name': user.last_name, 
        'qr_code_url': user.qr_code.url    
    }
    return render(request, 'confirmation.html', context)
    
@login_required
def supprimer_du_panier(request, panier_item_id):
    panier_item = get_object_or_404(Panier, id=panier_item_id, user=request.user)
    panier_item.delete()
    return redirect('panier')
