# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Tilex.Repo.insert!(%Tilex.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Tilex.{Channel, Developer, Post, Repo}

Repo.delete_all(Post)
Repo.delete_all(Channel)
Repo.delete_all(Developer)

Repo.insert!(%Channel{name: "phoenix", twitter_hashtag: "phoenix"})
Repo.insert!(%Channel{name: "elixir", twitter_hashtag: "myelixirstatus"})

Repo.insert!(%Developer{email: "wm@waltermcginnis.com",
                        username: "walter",
                        twitter_handle: "wtem",
                        editor: "emacs",
                        google_id: "garbage",
                        admin: true
                       })
