from django.urls import path

from api.views import PingView, TriggerGunicornReloadView

urlpatterns = [
    path("ping/", PingView.as_view(), name="ping"),
    path("reload/", TriggerGunicornReloadView.as_view(), name="reload"),
]
