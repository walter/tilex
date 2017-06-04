defmodule Tilex.Til do
  alias Tilex.Post

  def prepare_post(params \\ %{}) do
    %Post{}
    |> Post.changeset(params)
  end
end
