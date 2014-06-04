Feature: Wire transfer
  As a maker 
  I want to give nuts 
  In order to thank for a service

  Scenario: Alice and Bob
    Given a maker Alice
    And a maker Bob
    When Alice sends 100<> to Bob
    Then Bob's account is increased by 100<>
    And Alice's account is decreased by 100<>


