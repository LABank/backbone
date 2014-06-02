Feature: Administrator authentication
  As an administrator
  I can view the administration page
  In order to manage the system

  Scenario: Valid administrator
    Given an administrator
    When he logs in 
    Then he can view the administration page

  Scenario: Simple maker
    Given a maker
    When he logs in
    Then he cannot access the administration page
