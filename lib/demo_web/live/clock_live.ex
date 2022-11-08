defmodule DemoWeb.ClockLive do
  use DemoWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket) do
      Process.send_after(self(), :tick, 1000)
    end

    socket = assign(socket, :now, Time.utc_now())
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1> The time is <%=@now%> </h1>
    """
  end
end
