import subprocess

from django.conf import settings
from rest_framework.response import Response
from rest_framework.views import APIView


class TriggerGunicornReloadView(APIView):
    def post(self, request):
        subprocess.call(settings.BASE_DIR / "gunicorn-grace-reload.sh")
        return Response({"success": True})


class PingView(APIView):
    def get(self, request):
        return Response({"value": settings.CUSTOM_SETTING})
