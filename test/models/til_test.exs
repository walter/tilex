defmodule Tilex.TilTest do
  use Tilex.ModelCase#, async: true

  alias Tilex.Til

  describe "#prepare_post" do
    test "it creates an empty Post changeset when given no params" do
      post_changeset = Til.prepare_post()

      assert post_changeset.changes == %{}
    end

    test "it creates a Post changeset with given params" do
      params = %{
        "title" => "How to SQL",
        "body" => "Everything is a table"
      }
      post_changeset = Til.prepare_post(params)

      assert post_changeset.changes[:title] == "How to SQL"
      assert post_changeset.changes[:body] == "Everything is a table"
    end
  end
end
