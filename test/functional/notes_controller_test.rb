require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Note.first
    assert_template 'show'
  end

  def test_destroy
    note = Note.first
    delete :destroy, :id => note
    assert_redirected_to notes_url
    assert !Note.exists?(note.id)
  end

  def test_update_invalid
    Note.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Note.first
    assert_template 'edit'
  end

  def test_update_valid
    Note.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Note.first
    assert_redirected_to note_url(assigns(:note))
  end
end
