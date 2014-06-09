Feature: Wire transfer
  As a maker 
  I want to give nuts 
  In order to thank for a service

  Scenario: Alice and Bob
    Given a maker Alice
    And a maker Bob
    When Alice start a new transfer
    And provides the amout, the destination account and the description
    And she validates the transfer
    Then Bob's account is increased by 100<>
    And Alice's account is decreased by 100<>


