require "application_system_test_case"

class CandiesTest < ApplicationSystemTestCase
  setup do
    @candy = candies(:one)
  end

  test "visiting the index" do
    visit candies_url
    assert_selector "h1", text: "Candies"
  end

  test "should create candy" do
    visit candies_url
    click_on "New candy"

    fill_in "Name", with: @candy.name
    check "Status" if @candy.status
    click_on "Create Candy"

    assert_text "Candy was successfully created"
    click_on "Back"
  end

  test "should update Candy" do
    visit candy_url(@candy)
    click_on "Edit this candy", match: :first

    fill_in "Name", with: @candy.name
    check "Status" if @candy.status
    click_on "Update Candy"

    assert_text "Candy was successfully updated"
    click_on "Back"
  end

  test "should destroy Candy" do
    visit candy_url(@candy)
    click_on "Destroy this candy", match: :first

    assert_text "Candy was successfully destroyed"
  end
end
