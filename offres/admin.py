from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from users.models import CustomUser
from offres.models import Offre, Sport, Evenement, Panier
from django.db.models import Count



@admin.register(Panier)
class PanierAdmin(admin.ModelAdmin):
    list_display = ('offre', 'evenement', 'quantite', 'type_offre')

    def changelist_view(self, request, extra_context=None):
        extra_context = extra_context or {}
        extra_context.update(self.get_sales_data())
        return super().changelist_view(request, extra_context=extra_context)
    
    def get_sales_data(self):
        sales_data = Panier.objects.values('type_offre').annotate(total_sales=Count('id'))
        return {
            'solo_sales': sales_data.filter(type_offre='solo').aggregate(total_solo_sales=Count('id'))['total_solo_sales'],
            'duo_sales': sales_data.filter(type_offre='Duo').aggregate(total_duo_sales=Count('id'))['total_duo_sales'],
            'familliale_sales': sales_data.filter(type_offre='Familliale').aggregate(total_familliale_sales=Count('id'))['total_familliale_sales'],
                }

        

        

@admin.register(Offre)
class OffreAdmin(admin.ModelAdmin):
    list_display = ('titre', 'sport', 'description', 'date', 'prix')
    fields = ('titre', 'description', 'image', 'sport', 'date', 'prix')

admin.site.register(Sport)
admin.site.register(Evenement)