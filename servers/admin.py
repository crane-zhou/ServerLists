# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from .models import base_types,configuration_lists,configurations,hardware_accessories


# Register your models here.
@admin.register(base_types)
class BaseTypesAdmin(admin.ModelAdmin):
    fields = ('type', 'name', 'tags', 'order', 'status', 'comment')
    list_display = ('type', 'name', 'tags', 'order', 'status', 'comment')


@admin.register(configuration_lists)
class ConfigurationListsAdmin(admin.ModelAdmin):
    fields = ('name', 'count', 'platform', 'device', 'realtime', 'offline', 'service', 'configuration', 'bandwith', 'order', 'status', 'comment')
    list_display = ('name', 'count', 'platform', 'device', 'realtime', 'offline', 'service', 'bandwith', 'order', 'status', 'comment')


@admin.register(configurations)
class ConfigurationsAdmin(admin.ModelAdmin):
    fields = ('name', 'motherboard', 'cpu', 'memory', 'raidcard', 'disk1', 'disk2', 'default', 'count', 'category', 'order', 'status', 'comment')
    list_display = ('name', 'motherboard', 'cpu', 'memory', 'raidcard', 'disk1', 'disk2', 'default', 'count', 'category', 'order', 'status', 'comment')


@admin.register(hardware_accessories)
class HardwareAccessoriesAdmin(admin.ModelAdmin):
    fields = ('type', 'name', 'order', 'status', 'comment')
    list_display = ('type', 'name', 'order', 'status', 'comment')

