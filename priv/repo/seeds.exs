# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     StoryMapper.Repo.insert!(%StoryMapper.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
StoryMapper.Repo.insert_all("projects",[[
  title: "My First Project", inserted_at: DateTime.utc_now(), updated_at: DateTime.utc_now()
]])

project =  StoryMapper.Projects.get_project!(1)
StoryMapper.Repo.insert_all(
  "stories",
  [[
    title: "My First User Story", project_id: project.id, inserted_at: DateTime.utc_now(), updated_at: DateTime.utc_now()
  ]]
)
