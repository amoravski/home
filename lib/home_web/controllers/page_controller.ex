defmodule HomeWeb.PageController do
  use HomeWeb, :controller

    alias Home.Activities
    alias Home.Activities.Note

  def index(conn, _params) do
    notes = Activities.list_notes()
    render conn, "index.html", notes: notes
  end
end
