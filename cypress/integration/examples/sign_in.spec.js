
/// <reference types="cypress" />

describe('Rails using scenarios examples', function() {
  it('setup basic scenario', function() {
    cy.visit('localhost:3000/')
    cy.get('input')
      .contains('Registrarse')
      .click();

    cy.url().should('include', '/users/new');

    cy.get('#user_name').type('pedrin');
    cy.get('#user_last_name').type('picapiedra');
    cy.get('#user_email').type('pedrito@picapiedra.com');
    cy.get('#user_password').type('picapiedra');
    cy.get('#user_password_confirmation').type('picapiedra');

    cy.get('input')
      .contains('Actualizar usuario')
      .click();

    cy.url().should('include', '/babies');

    cy.get('h2')
      .contains('Mis bebés')
      .should('be.visible');

    cy.get('a.nav-link.active')
      .contains('Salir')
      .click();

    cy.url().should('include', '/');

    cy.get('h1')
      .contains('BeMyBaby')
      .should('be.visible');

    cy.get('input')
      .contains('Entrar')
      .click();

    cy.url().should('include', '/new_session');

    cy.get('#email').type('pedrito@picapiedra.com');
    cy.get('#password').type('picapiedra');

    cy.get('input')
    .contains('Entrar')
    .click();

    cy.get('a')
      .contains('Registrar bebé')
      .click();

    cy.get('#baby_name').type('Baby')
    cy.get('#baby_last_name').type('Fever')
    cy.get('#baby_dob_1i').select('2020')
    cy.get('#baby_dob_2i').select('January')
    cy.get('#baby_dob_3i').select('1')
    cy.get('#baby_gender').select('niño')
    cy.get('#baby_blood_type').select('A-')
    cy.get('input')
      .contains('Guardar')
      .click()
  });
})
