defmodule Tilex.Til do
  alias Tilex.Post

  def prepare_post(params \\ %{}) do
    %Post{}
    |> Post.changeset(params)
  end

  def create_post(params, nil) do
    do_create_post(params)
  end
  def create_post(params, developer) do
    params
    |> Map.put("developer_id", developer.id)
    |> do_create_post()
  end

  defp do_create_post(params) do
    params
    |> prepare_post()
    |> Tilex.Repo.insert()
  end
end
