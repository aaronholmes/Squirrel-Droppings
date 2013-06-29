require 'test_helper'

class BookmarkTest < ActiveSupport::TestCase
  setup do
    @bookmark_defaults = {
        title:      "my bookmark",
        summary:    "A very interesting bookmark indeed.",
        screenshot: "http://example.com/example.jpg",
        url:        "http://www.example.com"
    }
  end

  test "should be invalid if missing required data" do
    bookmark = Bookmark.new
    assert !bookmark.valid?
    [:title, :summary, :url].each do |field_name|
      assert bookmark.errors.keys.include? field_name
    end
  end

  test "should be valid if required data exists" do
    bookmark = Bookmark.new(@bookmark_defaults)
    assert bookmark.valid?
  end

  test "should only allow one bookmark with the same url" do
    bookmark = Bookmark.new(@bookmark_defaults)
    bookmark.url = bookmarks(:two).url
    assert !bookmark.valid?
    assert bookmark.errors[:url].include? "has already been taken"
  end
end
