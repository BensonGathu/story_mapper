defmodule StoryMapperWeb.ProjectLiveTest do
  use StoryMapperWeb.ConnCase

  import Phoenix.LiveViewTest
  import StoryMapper.ProjectsFixtures
  import StoryMapper.StoriesFixtures
  @create_attrs %{title: "some title"}
  @update_attrs %{title: "some updated title"}
  @invalid_attrs %{title: nil}

  defp create_project(_) do
    project = project_fixture()
    %{project: project}
  end

  defp create_story(_) do

    story = story_fixture(%{title: "My First User Story"})
    %{story: story}
  end

  describe "Index" do
    setup [:create_project]

    test "lists all projects", %{conn: conn, project: project} do
      {:ok, _index_live, html} = live(conn, ~p"/projects")

      assert html =~ "Listing Projects"
      assert html =~ project.title
    end




  end

  describe "Show" do
    setup [:create_project, :create_story]

    test "displays project", %{conn: conn, project: project} do
      {:ok, _show_live, html} = live(conn, ~p"/projects/#{project}")

      assert html =~ "Show Project"
      assert html =~ project.title
      assert html =~ "My First User Story"
    end


  end
end
