@backend
Feature: Check the post admin module

Scenario: Check comment admin pages when not connected
  When I go to "admin/sonata/news/post/list"
  Then the response status code should be 200
  And I should see "Username"

Scenario: Check post admin pages when connected
  When I am connected with "admin" and "admin" on "admin/sonata/news/post/list"
  Then I should see "Filters"

Scenario: Add a new post with some errors
  When I am connected with "admin" and "admin" on "admin/sonata/news/post/create?uniqid=4f155592a220e"
  And I press "Create"
  Then I should see "An error has occurred during item creation."

Scenario: Add a new post
  When I am connected with "admin" and "admin" on "admin/sonata/news/post/create?uniqid=4f155592a220e"
  And I fill in "4f155592a220e_title" with "title"
  And I fill in "4f155592a220e_abstract" with "abstract"
  And I select "markdown" from "4f155592a220e_contentFormatter"
  And I fill in "4f155592a220e_rawContent" with "raw content"
  And I select "2" from "4f155592a220e_commentsDefaultStatus_2"
  And I press "Create"
  Then I should see "Item has been successfully created."

Scenario: Edit a post
  When I am connected with "admin" and "admin" on "admin/sonata/news/post/list"
  And I follow "title"
  And I press "Update"
  Then I should see "Item has been successfully updated."

Scenario: Export JSON data
  When I am connected with "admin" and "admin" on "admin/sonata/news/post/list"
  And I follow "json"
  Then the response status code should be 200

Scenario: Export CSV data
  When I am connected with "admin" and "admin" on "admin/sonata/news/post/list"
  And I follow "csv"
  Then the response status code should be 200

Scenario: Export XML data
  When I am connected with "admin" and "admin" on "admin/sonata/news/post/list"
  And I follow "xml"
  Then the response status code should be 200

Scenario: Export XLS data
  When I am connected with "admin" and "admin" on "admin/sonata/news/post/list"
  And I follow "xls"
  Then the response status code should be 200

Scenario: Delete a post
  When I am connected with "admin" and "admin" on "admin/sonata/news/post/list"
  And I fill in "filter_title_value" with "title"
  And I press "Filter"
  And I follow "title"
  And I follow "Delete"
  And I press "Yes, delete"
  Then I should see "Item has been deleted successfully."