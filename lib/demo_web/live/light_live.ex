defmodule DemoWeb.LightLive do
use DemoWeb, :live_view

  def mount(_params, _session, socket) do

     socket =
      socket
      |> assign(:light_bulb_status, "off")
      |> assign(:on_button_status, "")
      |> assign(:off_button_status, "disabled")
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1> The light is <%=@light_bulb_status%>. </h1>
    <button phx-click="on" <%=@on_button_status%>>ON</button>
    <button phx-click="off" <%=@off_button_status%>>OFF</button>
    """
  end

  def handle_event("on", _params, socket) do
    socket =
      socket
      |> assign(:light_bulb_status, "on")
      |> assign(:on_button_status, "disabled")
      |> assign(:off_button_status, "")
    {:noreply, socket}
  end

  def handle_event("off", _params, socket) do
    socket =
      socket
      |> assign(:light_bulb_status, "off")
      |> assign(:on_button_status, "")
      |> assign(:off_button_status, "disabled")
    {:noreply, socket}
  end
end
