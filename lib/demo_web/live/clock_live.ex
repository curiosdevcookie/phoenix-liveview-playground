defmodule DemoWeb.ClockLive do
  use DemoWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket) do
      Process.send_after(self(), :tick, 3000)
    end

    socket = assign(socket, :now, Time.utc_now())
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1> The time is <%=@now%>.</h1>
    """
  end

  def handle_info(:tick, socket) do
   socket = assign_current_time(socket)
    {:noreply, socket}
  end

  def assign_current_time(socket) do
    now=
      Time.utc_now()
      |> Time.to_string()
      |> String.slice(0..7)
    assign(socket, :now, now)
  end
end
