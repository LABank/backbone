Feature: Balance check
  As a maker
  I want to check my balance
  In order to know how much nuts I have

  Scenario: Single account
    Given a maker having 100<> on his account
    When I go the the accounts page
    Then I see my account with 100<>