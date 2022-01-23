/// <reference types="cypress" />

// Welcome to Cypress!
//
// This spec file contains a variety of sample tests
// for a todo list app that are designed to demonstrate
// the power of writing tests in Cypress.
//
// To learn more about how Cypress works and
// what makes it such an awesome testing tool,
// please read our getting started guide:
// https://on.cypress.io/introduction-to-cypress

describe('Check if mocking is possible', () => {
  it('Should be able to mock', () => {
    cy.intercept('GET', 'https://www.breakingbadapi.com/api/characters', {
      statusCode: 201,
      body: {
        name: 'Peter Pan',
      },
    })
    cy.visit("/")
  })
})
