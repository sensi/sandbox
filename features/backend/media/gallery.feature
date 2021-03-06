@backend
Feature: Check the gallery admin module

Scenario: Check gallery admin pages when not connected
  When I go to "admin/sonata/media/gallery/list"
  Then the response status code should be 200
  And I should see "Username"

Scenario: Check gallery admin pages when connected
  When I am connected with "admin" and "admin" on "admin/sonata/media/gallery/list"
  Then I should see "Filters"

Scenario: Add a new gallery with some errors
  When I am connected with "admin" and "admin" on "admin/sonata/media/gallery/create?context=default&uniqid=4f155592a220e"
  And I press "Create"
  Then I should see "An error has occurred during item creation."

Scenario: Add a new gallery
  When I am connected with "admin" and "admin" on "admin/sonata/media/gallery/create?context=default&uniqid=4f155592a220e"
  And I fill in "4f155592a220e_name" with "toto"
  And I press "Create"
  Then I should see "Item has been successfully created."

Scenario: Edit a gallery
  When I am connected with "admin" and "admin" on "admin/sonata/media/gallery/list"
  And I follow "toto"
  And I press "Update"
  Then I should see "Item has been successfully updated."

Scenario: Export JSON data
  When I am connected with "admin" and "admin" on "admin/sonata/media/gallery/list"
  And I follow "json"
  Then the response status code should be 200

Scenario: Export CSV data
  When I am connected with "admin" and "admin" on "admin/sonata/media/gallery/list"
  And I follow "csv"
  Then the response status code should be 200

Scenario: Export XML data
  When I am connected with "admin" and "admin" on "admin/sonata/media/gallery/list"
  And I follow "xml"
  Then the response status code should be 200

Scenario: Export XLS data
  When I am connected with "admin" and "admin" on "admin/sonata/media/gallery/list"
  And I follow "xls"
  Then the response status code should be 200

Scenario: Delete a gallery
  When I am connected with "admin" and "admin" on "admin/sonata/media/gallery/list"
  And I fill in "filter_name_value" with "toto"
  And I press "Filter"
  And I follow "toto"
  And I follow "Delete"
  And I press "Yes, delete"
  Then I should see "Item has been deleted successfully."