require 'test_helper'

class PollsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Poll.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Poll.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Poll.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to poll_url(assigns(:poll))
  end
  
  def test_edit
    get :edit, :id => Poll.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Poll.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Poll.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Poll.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Poll.first
    assert_redirected_to poll_url(assigns(:poll))
  end
  
  def test_destroy
    poll = Poll.first
    delete :destroy, :id => poll
    assert_redirected_to polls_url
    assert !Poll.exists?(poll.id)
  end
end
