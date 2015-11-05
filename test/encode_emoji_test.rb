#coding: utf-8
require 'test_helper'

class EncodeEmojiTest < ActiveSupport::TestCase
  test "Module" do
    assert_kind_of Module, MonkeyEmoji
  end

  test "Post.encode_emoji" do
    post = ::Post.new
    emoji_text = "📱 Phone"
    post.title = emoji_text

    assert "{{1f4f1}} Phone", post.title
    assert emoji_text, post.title.decode_emoji
  end
end
