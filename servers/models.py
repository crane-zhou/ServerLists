# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.


class base_types(models.Model):
    type = models.SmallIntegerField()
    name = models.CharField(max_length=100,unique=True)
    tags = models.CharField(max_length=100,default=0)
    order = models.SmallIntegerField(default=0)
    status = models.SmallIntegerField(default=1)
    comment = models.CharField(max_length=200,blank=True)

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = '基础类型'
        verbose_name_plural = '基础类型'


class hardware_accessories(models.Model):
    type = models.SmallIntegerField()
    name = models.CharField(max_length=100,unique=True)
    order = models.SmallIntegerField(default=0)
    status = models.SmallIntegerField(default=1)
    comment = models.CharField(max_length=200, blank=True)

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = '服务器硬件配件'
        verbose_name_plural = '服务器硬件配件'


class configurations(models.Model):
    name = models.CharField(max_length=100,unique=True )
    motherboard = models.ForeignKey('hardware_accessories',related_name="motherboard",)
    cpu = models.ForeignKey('hardware_accessories',related_name="cpu",)
    memory = models.ForeignKey('hardware_accessories',related_name="memory",)
    raidcard = models.ForeignKey('hardware_accessories',related_name="raidcard",)
    disk1 = models.ForeignKey('hardware_accessories',related_name="disk1",)
    disk2 = models.ForeignKey('hardware_accessories',related_name="disk2",)
    default = models.ForeignKey('hardware_accessories',related_name="default",)
    count = models.ForeignKey('hardware_accessories',related_name="count")
    category = models.SmallIntegerField(default=0)
    order = models.SmallIntegerField(default=0)
    status = models.SmallIntegerField(default=1)
    comment = models.CharField(max_length=200, blank=True)

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = '服务器配置'
        verbose_name_plural = '服务器配置'


class configuration_lists(models.Model):
    name = models.CharField(max_length=100,unique=True)
    count = models.SmallIntegerField(default=1)
    platform = models.ForeignKey('base_types',related_name="platform",)
    device = models.ForeignKey('base_types',related_name="device",)
    realtime = models.ForeignKey('base_types',related_name="realtime",)
    offline = models.ForeignKey('base_types',related_name="offline",)
    service = models.ForeignKey('base_types',related_name="service",)
    configuration = models.ManyToManyField('configurations')
    bandwith = models.ForeignKey('hardware_accessories')
    order = models.SmallIntegerField(default=0)
    status = models.SmallIntegerField(default=1)
    comment = models.CharField(max_length=200, blank=True)

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = '服务器清单'
        verbose_name_plural = '服务器清单'
        unique_together = ("platform", "device","realtime",'offline')


