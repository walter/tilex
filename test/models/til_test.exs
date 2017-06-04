defmodule Tilex.TilTest do
  use Tilex.ModelCase#, async: true

  alias Tilex.Til
  alias Tilex.Factory

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

  describe "#create_post" do
    test "it creates a post with valid info" do
      developer = Factory.insert!(:developer)
      channel = Factory.insert!(:channel)

      params = %{
        "title" => "How to SQL",
        "body" => "Everything is a table",
        "channel_id" => channel.id
      }

      {:ok, post} = Til.create_post(params, developer)

      assert post.title == "How to SQL"
      assert post.body == "Everything is a table"
      assert post.channel_id == channel.id
      assert post.developer_id == developer.id
    end

    test "it returns :error and a changeset with invalid developer" do
      channel = Factory.insert!(:channel)

      params = %{
        "title" => "How to SQL",
        "body" => "Everything is a table",
        "channel_id" => channel.id
      }

      {:error, changeset} = Til.create_post(params, nil)

      assert changeset.errors[:developer_id] == {"can't be blank", [validation: :required]}
    end

    test "it returns :error and a changeset with invalid info" do
      developer = Factory.insert!(:developer)
      channel = Factory.insert!(:channel)

      params = %{
        "title" => "",
        "body" => "Everything is a table",
        "channel_id" => channel.id
      }

      {:error, changeset} = Til.create_post(params, developer)

      assert changeset.errors[:title] == {"can't be blank", [validation: :required]}
    end
  end
end
