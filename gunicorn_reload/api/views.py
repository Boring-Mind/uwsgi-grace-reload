import subprocess

from django.conf import settings
from rest_framework.response import Response
from rest_framework.views import APIView


class TriggerGunicornReload(APIView):
    def post(self, request):
        subprocess.call(settings.BASE_DIR / "gunicorn-grace-reload.sh")
        return Response({"success": True})
