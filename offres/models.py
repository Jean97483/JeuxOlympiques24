#offres/models.py
from django.conf import settings
from django.db import models

class Sport(models.Model):
    nom = models.CharField(max_length=100)

    def __str__(self):
        return self.nom

class Evenement(models.Model):
    date = models.DateField()
    sport = models.ForeignKey(Sport, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.sport.nom} - {self.date}" 
    
class Offre(models.Model):
    titre = models.CharField(max_length=100)
    description = models.TextField()
    image = models.ImageField(upload_to='images/')
    sport = models.ForeignKey(Sport, on_delete=models.CASCADE)
    date = models.DateField()
    prix = models.DecimalField(max_digits=10, decimal_places=2, default=0.0)
    evenements = models.ManyToManyField(Evenement)

    def __str__(self):
        return self.titre 
    

class Panier(models.Model):
    offre = models.ForeignKey(Offre, on_delete=models.CASCADE)
    evenement = models.ForeignKey(Evenement, on_delete=models.CASCADE)
    quantite = models.PositiveIntegerField(default=1)
    type_offre = models.CharField(max_length=50)

    def __str__ (self):
        return f"{self.offre.titre} - {self.evenement.date} - {self.quantite} - {self.type_offre}"