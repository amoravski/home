defmodule Home.ActivitiesTest do
  use Home.DataCase

  alias Home.Activities

  describe "notes" do
    alias Home.Activities.Note

    @valid_attrs %{content: "some content", name: "some name"}
    @update_attrs %{content: "some updated content", name: "some updated name"}
    @invalid_attrs %{content: nil, name: nil}

    def note_fixture(attrs \\ %{}) do
      {:ok, note} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Activities.create_note()

      note
    end

    test "list_notes/0 returns all notes" do
      note = note_fixture()
      assert Activities.list_notes() == [note]
    end

    test "get_note!/1 returns the note with given id" do
      note = note_fixture()
      assert Activities.get_note!(note.id) == note
    end

    test "create_note/1 with valid data creates a note" do
      assert {:ok, %Note{} = note} = Activities.create_note(@valid_attrs)
      assert note.content == "some content"
      assert note.name == "some name"
    end

    test "create_note/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Activities.create_note(@invalid_attrs)
    end

    test "update_note/2 with valid data updates the note" do
      note = note_fixture()
      assert {:ok, note} = Activities.update_note(note, @update_attrs)
      assert %Note{} = note
      assert note.content == "some updated content"
      assert note.name == "some updated name"
    end

    test "update_note/2 with invalid data returns error changeset" do
      note = note_fixture()
      assert {:error, %Ecto.Changeset{}} = Activities.update_note(note, @invalid_attrs)
      assert note == Activities.get_note!(note.id)
    end

    test "delete_note/1 deletes the note" do
      note = note_fixture()
      assert {:ok, %Note{}} = Activities.delete_note(note)
      assert_raise Ecto.NoResultsError, fn -> Activities.get_note!(note.id) end
    end

    test "change_note/1 returns a note changeset" do
      note = note_fixture()
      assert %Ecto.Changeset{} = Activities.change_note(note)
    end
  end
end
