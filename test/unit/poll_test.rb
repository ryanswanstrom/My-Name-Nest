require 'test_helper'

class PollTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Poll.new.valid?
  end
end
