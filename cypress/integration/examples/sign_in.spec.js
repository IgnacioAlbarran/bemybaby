  describe('Rails using scenarios examples', function() {
    it('setup basic scenario', function() {
      cy.visit('localhost:3000/')
      cy.get('input')
        .contains('Registrarse')
        .click();

      cy.url().should('include', '/users/new');

      cy.get('#user_name').type('pedrin');
      cy.get('#user_last_name').type('picapiedra');
      cy.get('#user_email').type('pedri@picapiedra.com');
      cy.get('#user_password').type('picapiedra');
      cy.get('#user_password_confirmation').type('picapiedra');

      cy.get('input')
        .contains('Actualizar usuario')
        .click();

      cy.url().should('include', '/babies');

      cy.get('h2')
        .contains('Mis bebés')
        .should('be.visible');

      cy.get('a')
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

      cy.get('#email').type('pedritote@picapiedra.com');
      cy.get('#password').type('picapiedra');

      cy.get('input')
      .contains('Entrar')
      .click();
    });
  })
