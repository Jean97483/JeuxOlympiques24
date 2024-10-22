#offres/urls.py
from django.urls import path
from . import views
from .views import panier, ajouter_au_panier, supprimer_du_panier, CustomLoginView, custom_logout_view, simulate_payment
from users.views import register_view

urlpatterns = [
    path('', views.accueil, name='accueil'),
    path('evenements/', views.evenement, name='evenements'),
    path('panier/', views.panier_view, name='panier'),
    path('supprimer_du_panier/<int:panier_item_id>/', views.supprimer_du_panier, name='supprimer_du_panier'),
    path('ajouter_au_panier/<int:offre_id>/<int:evenement_id>/', ajouter_au_panier, name='ajouter_au_panier'),
    path('supprimer_du_panier/<int:panier_item_id>/', supprimer_du_panier, name='supprimer_du_panier'),
    path('inscription/', register_view, name='inscription'),
    path('connexion', CustomLoginView.as_view(), name='connexion'),
    path('deconnexion', custom_logout_view, name='deconnexion'),
    path('simulate_payment/', views.simulate_payment, name='simulate_payment'),
         
]

