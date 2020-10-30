describe('Sign in', () => {
  beforeEach(() => {
    cy.visit('localhost:5017/');
  });

  it('signs in user with valid credentials', () => {
    cy.get('input')
      .contains('Entrar')
      .click();

    cy.url().should('include', '/new_session');

    cy.get('input[name=email]').type('user@example.com');
    cy.get('input[name=password]').type('test123');

    cy.get('input')
      .contains('Entrar')
      .click();

    cy.get('h2')
      .contains('Mis bebés')
      .should('be.visible');
  });
});cy.get('input[name=email]')
.type(user.email)
