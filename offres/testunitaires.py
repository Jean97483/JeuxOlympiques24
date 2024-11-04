from django.test import TestCase
from django.urls import reverse

# Accès au site des Jeux Olympiques
class HomePageTests(TestCase):

    def test_home_page_status_code(self):
        """Test si la page d'accueil est accessible."""
        response = self.client.get(reverse('accueil'))
        self.assertEqual(response.status_code, 200)

    def test_navigation_links(self):
        """Test si les liens de navigation sont accessibles."""
        for url_name in ['accueil', 'evenements', 'panier']:
            response = self.client.get(reverse(url_name))
            self.assertEqual(response.status_code, 200)