from django.core.files.uploadedfile import SimpleUploadedFile
from django.test import TestCase
from django.urls import reverse
from .models import Panier, Offre, Evenement, Sport
from django.contrib.auth import get_user_model
from users.models import CustomUser

User = get_user_model()

# Accès à la page d'accueil du site des Jeux Olympiques et des liens de navigations
class HomePageTests(TestCase):

    def test_home_page_status_code(self):
        """Test si la page d'accueil est accessible."""
        response = self.client.get(reverse('accueil'))
        self.assertEqual(response.status_code, 200)

    def test_navigation_links(self):
        """Test si les liens de navigation sont accessibles."""
        for url_name in ['accueil', 'evenements', 'panier']:
            response = self.client.get(reverse(url_name), follow=True)
            self.assertEqual(response.status_code, 200)

#Test les actions dans le panier, comme l'ajout et la mise à jour des quantités
class PanierTests(TestCase):

    def setUp(self):
         # Configuration de données pour les tests
         sport = Sport.objects.create(nom="NATATION")
         evenement = Evenement.objects.create(date="2024-07-26", sport=sport)
         self.offre = Offre.objects.create(
             titre="Offre Spéciale Natation",
             description="Accès complet aux épreuves de natation",
             sport=sport,
             date="2024-07-26",
             prix=120.0
             )
         # Panier pour le test
         self.panier = Panier.objects.create(
             user_id=1,
             offre=self.offre,
             evenement=evenement,
             quantite=1,
             type_offre="Individuel"
             )

    def test_ajout_offre_au_panier(self):
        """Test l'ajout d'une offre au panier."""
        response = self.client.post(
            reverse('ajouter_au_panier', kwargs={'offre_id': self.offre.id, 'evenement_id': self.panier.evenement.id}),
            {'offre_id': self.offre.id}
            )
        panier = Panier.objects.get()
        self.assertEqual(panier.offre, self.offre)

    def test_quantite_panier(self):
        """Test si la quantité du panier est mise à jour correctement."""
        self.panier.quantite += 1
        self.panier.save()
        panier = Panier.objects.get(id=self.panier.id)
        self.assertEqual(panier.quantite, 2)

#Vérifie l'affichages des événements et l'ajout d'offres au panier
class EvenementTests(TestCase):

    def setUp(self):
        #Configuration de données pour les tests
        self.user = User.objects.create_user(username="testuser", password="testpassword")
        self.sport = Sport.objects.create(nom="Basketball")
        self.evenement1 = Evenement.objects.create(date="2024-08-01", sport=self.sport)
        self.evenement2 = Evenement.objects.create(date="2024-08-02", sport=self.sport)
        self.offre = Offre.objects.create(
            titre="Offre Basketball",
            description="Accès à tous les matchs de basketball",
            sport=self.sport,
            date="2024-08-01",
            prix=100.0,
            image=SimpleUploadedFile(name='test_image.jpg', content=b'', content_type='image/jpeg')
        )
        # Ajout d'un élément au panier pour le test de suppression
        self.panier_item = Panier.objects.create(
            user=self.user,
            offre=self.offre,
            evenement=self.evenement1,
            quantite=1,
            type_offre="Solo"
        )
        self.client.login(username="testuser", password="testpassword")

    def test_affichage_liste_evenements(self):
        """Test que la liste des événements s'affiche correctement."""
        response = self.client.get(reverse('evenements'))
        self.assertEqual(response.status_code, 200)
        #Vérifie que les événements crées sont présents dans la réponse
        self.assertContains(response, "1 novembre 2024")
        self.assertContains(response, "2 novembre 2024")
        self.assertContains(response, "Basketball")

    def test_ajout_offre_au_panier(self):
        """Test l'ajout d'une offre au panier depuis la page événements."""
        Panier.objects.filter(user=self.user).delete() #Assure que le panier est vide
        response = self.client.post(
            reverse('ajouter_au_panier', kwargs={'offre_id': self.offre.id, 'evenement_id': self.evenement1.id}),
            {'type_offre': 'Solo'}
        )
        self.assertEqual(response.status_code, 302) # Redirection après ajout au panier

        panier = Panier.objects.get(user=self.user)
        self.assertEqual(panier.offre, self.offre)
        self.assertEqual(panier.evenement, self.evenement1)
        self.assertEqual(panier.quantite, 1)

    def test_suppression_panier_item(self):
        """Test que la suppression d'un evenement fonctionne correctement."""
        #Suppression de l'élément du panier
        response = self.client.post(reverse('supprimer_du_panier', kwargs={'panier_item_id': self.panier_item.id}), follow=True)
        self.assertEqual(response.status_code, 200)
        # Vérifie que l'élément a été supprimé du panier
        self.assertFalse(Panier.objects.filter(id=self.panier_item.id).exists())

#Teste la connexion, la déconnexion et les messages d'erreur pour les identifiants incorrects
class AuthenticationTests(TestCase):

    def setUp(self):
        #Création d'un utilisateur pour les tests
        self.user = User.objects.create_user(username="testuser", password="testpassword")

    def test_connexion_identifiants_valides(self):
        """Test de la connexion avec des identifiants valides."""
        response = self.client.post(reverse('connexion'), {'username': 'testuser', 'password': 'testpassword'})
        #Vérifie que la connexion est réussie et qu'il y a une redirection après
        self.assertEqual(response.status_code, 302)
        self.assertRedirects(response, reverse('accueil'))

    def test_connexion_identifiants_invalides(self):
        """Test de la connexion avec des identifiants invalides."""
        response = self.client.post(reverse('connexion'), {'username': 'testuser', 'password': 'wrongpassword'})
        #Vérifie que la connexion échoue (status 200 car la page de connexion est réaffichée avec une erreur)
        self.assertEqual(response.status_code, 200)
        #Vérifie qu'un message d'erreur est présent dans le contexte de la réponse
        self.assertContains(response, "Saisissez un nom d’utilisateur et un mot de passe valides. Remarquez que chacun de ces champs est sensible à la casse (différenciation des majuscules/minuscules).")

    def test_deconnexion(self):
        """Test de la déconnexion"""
        #Connexion de l'utilisateur pour tester la déconnexion
        self.client.login(username='testuser', password='testpassword')
        response = self.client.get(reverse('deconnexion'))
        #Vérifie que l'utilisateur est redirigé après la déconnexion
        self.assertEqual(response.status_code, 302)
        self.assertRedirects(response, reverse('connexion'))

#Vérifie la génération des clés uniques pour chaque utilisateurs et chaque transaction
class SecurityKeyTests(TestCase):

    def test_generation_cle_utilisateur(self):
        """Vérifie qu'une clé unique est générée pour un nouvel utilisateur lors de l'inscription"""
        response = self.client.post(reverse('inscription'), {
            'username': 'nouvel_utilisateur',
            'password1': 'testpassword123',
            'password2': 'testpassword123',
            'first_name': 'Test',
            'last_name': 'Utilisateur',
            'email': 'test@exemple.com'
        })
        #Vérifie que l'inscription est réussie et qu'il y a une redirection (302)
        if response.status_code == 200:
            print(response.content.decode())

        self.assertEqual(response.status_code, 302)

        #Récupère le nouvel utilisateur et vérifie la clé unique
        utilisateur = User.objects.get(username='nouvel_utilisateur')
        self.assertIsNotNone(utilisateur.unique_key)
        self.assertEqual(len(utilisateur.unique_key), 43)
        self. assertTrue(utilisateur.unique_key, msg="La clé unique devrait être généré pour chaque nouvel utilisateur.")

    def test_generation_cle_transaction(self):
        """Vérifie qu'une clé de transaction unique est générée pour chaque achat et qu'elle est différente de la clé utilisateur."""

        #Création d'un utilisateur
        utilisateur = User.objects.create_user(username="testuser", password="testpassword")
        self.client.login(username='testuser', password='testpassword')

        #Simule un panier dans la session
        self.client.session.save()

        #Effectue l'achat
        response = self.client.post(reverse('simulate_payment'), follow=True)

        #Recharge l'utilisateur depuis la base de données pour vérifier les modifications
        utilisateur.refresh_from_db()

        #Vérifie que la clé de transaction a été générée et est unique
        self.assertIsNotNone(utilisateur.purchase_key)
        self.assertIsNotNone(utilisateur.final_key)
        self.assertNotEqual(utilisateur.purchase_key, utilisateur.unique_key)
        self.assertNotEqual(utilisateur.final_key, utilisateur.unique_key)
        self.assertEqual(len(utilisateur.purchase_key), 36)

#Simule un paiement pour s'assurer que le processus fonctionne correctement et que le panier est vidé après le paiement
class PaymentTests(TestCase):

    def setUp(self):
        #Configuration des données pour les tests
        self.user = User.objects.create_user(username="testuser", password="testpassword")
        self.sport = Sport.objects.create(nom="Natation")
        self.evenement = Evenement.objects.create(date="2024-07-26", sport=self.sport)
        self.offre = Offre.objects.create(
            titre="Billet Natation",
            description="Accès complet aux épreuves de natation",
            sport=self.sport,
            date="2024-07-06",
            prix=100.00
        )
        #Connexion de l'utilisateur
        self.client.login(username="testuser", password="testpassword")
        #Ajouter un billet au panier
        self.panier_item = Panier.objects.create(
            user=self.user,
            offre=self.offre,
            evenement=self.evenement,
            quantite=1,
            type_offre="Solo"
        )

    def test_access_to_payment_page(self):
        """Vérifie que l'utilisateur est redirigé vers la page de paiement avec les articles du panier."""
        response = self.client.get(reverse('panier'))
        self.assertEqual(response.status_code, 200)
        #Vérifie la présence des articles du panier
        self.assertContains(response, self.offre.titre)
        self.assertContains(response, f"{self.offre.prix:.2f}".replace(".", ","))

    def test_payment_information_validation(self):
        """Vérifie la validation des informations de paiement."""
        response = self.client.post(reverse('simulate_payment'), follow=True)
        self.assertEqual(response.status_code, 200)
        #Vérifie que le panier est vidé après le paiement
        panier_vide = Panier.objects.filter(user=self.user).count()
        self.assertEqual(panier_vide, 0)
        #vérifie la présence de la confirmation de paiement
        self.assertContains(response, "Confirmation d'achat")
        self.assertContains(response, self.user.first_name)











