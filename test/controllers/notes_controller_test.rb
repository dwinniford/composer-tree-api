require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @note = notes(:one)
  end

  test "should get index" do
    get notes_url, as: :json
    assert_response :success
  end

  test "should create note" do
    assert_difference('Note.count') do
      post notes_url, params: { note: { description: @note.description, parent_note_id: @note.parent_note_id, starred: @note.starred, title: @note.title, user_id: @note.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show note" do
    get note_url(@note), as: :json
    assert_response :success
  end

  test "should update note" do
    patch note_url(@note), params: { note: { description: @note.description, parent_note_id: @note.parent_note_id, starred: @note.starred, title: @note.title, user_id: @note.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete note_url(@note), as: :json
    end

    assert_response 204
  end
end
