from django.conf.urls import url


from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^lists$', views.lists, name='lists'),
    url(r'^menulists$', views.menulists, name='menulists'),
]
