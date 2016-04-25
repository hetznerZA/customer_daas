Feature: Bootstrap with an injected configuration
  As the Customer Service
  When I am bootstrapped
  In order to have all my dependencies
  I want to be injected
  With my configuration

  Scenario: Successful Bootstrap
    Given valid provider
    And valid configuration
    When I am bootstrapped
    Then I remember the configuration
    And bootstrap is successful

  Scenario: Invalid configuration
    Given valid provider
    And invalid configuration
    When I am bootstrapped
    Then I notify 'invalid configuration provided'

  Scenario: No configuration
    Given valid provider
    And no configuration
    When I am bootstrapped
    Then I notify 'no configuration provided'

  Scenario: Bootstrap failure
    Given valid provider
    And valid configuration
    And configuration bootstrap failure
    When I am bootstrapped
    Then I notify 'failure bootstrapping configuration'