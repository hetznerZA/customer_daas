Feature: Create Customer Profile
  As a customer service
  When a request is made for customer creation
  In order to create a customer Profile
  I want to submit the request to the relevant service 

  Scenario: Request for new profile   
    Given a request is made for customer creation
    When creating that profile
    Then submit the request

  Scenario: Request for new profile successful
    Given the new profile creation has been submitted
    When informing the requestor
    Then return a well-formed 'success' response

  Scenario: Request for new profile unsuccessful
    Given the new profile creation has been submitted
    When the request fails
    Then return a well-formed 'failure' response

  