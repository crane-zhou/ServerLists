# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.shortcuts import render_to_response
from django.http import HttpResponse
from django.template import RequestContext
from .models import base_types,configuration_lists,hardware_accessories,configurations

import json
# Create your views here.


def index(request):
    platforms = base_types.objects.filter(type=1).order_by("order")
    devices = base_types.objects.filter(type=2).order_by("order")
    realtimes = base_types.objects.filter(type=3).order_by("order")
    offlines = base_types.objects.filter(type=4).order_by("order")


    return render_to_response('index.html', locals())


def lists(request):
    platform_id = request.GET.get('platform_id')
    device_id = request.GET.get('device_id')
    realtime_id = request.GET.get('realtime_id')
    offline_id = request.GET.get('offline_id')

    configuration_lists_id_object = configuration_lists.objects.get(platform_id=platform_id,device_id=device_id,realtime_id=realtime_id,offline_id=offline_id)
    #print(configuration_lists_id_object)

    servernames = []
    for servername in configuration_lists_id_object.service.all().filter(status=1):
        servernames.append(servername.name)

    data = {'platform_id':platform_id,
            'device_id':device_id,
            'realtime_id':realtime_id,
            'offline_id':offline_id,
            'configuration_lists_id':configuration_lists_id_object.id,
            'count':configuration_lists_id_object.count,
            'bandwith':configuration_lists_id_object.bandwith.name,
            'servername': servernames,
            'configurations': [],
            }

    serverlists = configuration_lists_id_object.configuration.all().filter(status=1).order_by("-id")
    #print(serverlists)



    for server in serverlists:
        #print(server)
        # serverlist = configurations.objects.get(id=server.id)
        # accessorie = hardware_accessories.objects.all()
        # print(serverlist.memory)
        # print(type(serverlist.memory))
        data['configurations'].append({'id':server.id,
                                 'name':server.name,
                                 'count':server.count.name,
                                 'motherboard': hardware_accessories.objects.get(id=server.motherboard_id).name,
                                 'cpu': hardware_accessories.objects.get(id=server.cpu_id).name,
                                 'memory': hardware_accessories.objects.get(id=server.memory_id).name,
                                 'raidcard': hardware_accessories.objects.get(id=server.raidcard_id).name,
                                 'disk1': hardware_accessories.objects.get(id=server.disk1_id).name,
                                 'disk2': hardware_accessories.objects.get(id=server.disk2_id).name,
                                 'default': hardware_accessories.objects.get(id=server.default_id).name,
                                },)
        print(data)
    # print(data['configurations'][0]['memory'])
    # print(type(data))
    # print(data)
    data = json.dumps(data)
    # print(type(data))
    # print(data)
    return HttpResponse(data)


def menulists(request):

    platform_id = request.GET.get('platform_id',default=0)
    device_id = request.GET.get('device_id',default=0)
    realtime_id = request.GET.get('realtime_id',default=0)

    if platform_id != 0:
        basetypes_object = base_types.objects.filter(type=2,status=1,tags__contains=platform_id).order_by("order")
        data = {}
        for device in basetypes_object:
            if platform_id in device.tags.split(","):
                data[device.id] = device.name
        data = json.dumps(data)
        print(data)
        return HttpResponse(data)
    elif device_id != 0:
        basetypes_object = base_types.objects.filter(type=3,status=1,tags__contains=device_id).order_by("order")
        data = {}
        for realtime in basetypes_object:
            if device_id in realtime.tags.split(","):
                data[realtime.id] = realtime.name
        data = json.dumps(data)
        print(data)
        return HttpResponse(data)
    elif realtime_id != 0:
        basetypes_object = base_types.objects.filter(type=4,status=1,tags__contains=realtime_id).order_by("order")
        data = {}
        i = 0
        for offline in basetypes_object:
            if realtime_id in offline.tags.split(","):
                data[i] = [offline.id,offline.name]
                i = i + 1
        i = 0
        data = json.dumps(data)
        print(data)
        return HttpResponse(data)
    else:
        return HttpResponse("error")
