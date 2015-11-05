#coding: utf-8
require 'test_helper'

class CoreExtTest < ActiveSupport::TestCase
  test "str.encode_emoji" do
    assert_equal "test string", "test string".encode_emoji
    assert_equal "{{260e}}️", "☎️".encode_emoji
    assert_equal "{{1f4f1}}", "📱".encode_emoji
  end

  test "str.decode_emoji" do
    assert_equal "test string", "test string".decode_emoji
    assert_equal "☎️", "{{260e}}️".decode_emoji
    assert_equal "📱","{{1f4f1}}".decode_emoji 
  end

  test "nil.encode_emoji" do
    assert_equal nil, nil.encode_emoji
  end

  test "nil.decode_emoji" do
    assert_equal nil, nil.decode_emoji
  end
end
