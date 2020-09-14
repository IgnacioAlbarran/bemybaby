require 'rails_helper'

RSpec.describe BabiesController, type: :controller do
  let(:valid_attributes) { {'name' => 'Manolito', 'last_name' => 'Gafotas', 'dob' => '2020-09-13', 'gender' => 'niño', 'blood_type' => "A+"} }
  let(:invalid_attributes) { {'name' => '', 'last_name' => '', 'dob' => '', 'gender' => 'niño', 'blood_type' => 'A+'} }
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Baby.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      baby = Baby.create! valid_attributes
      get :show, params: {id: baby.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      baby = Baby.create! valid_attributes
      get :edit, params: {id: baby.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Baby" do
        expect {
          post :create, params: {baby: valid_attributes}, session: valid_session
        }.to change(Baby, :count).by(1)
      end

      it "redirects to the created baby" do
        post :create, params: {baby: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Baby.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {baby: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested baby" do
        baby = Baby.create! valid_attributes
        put :update, params: {id: baby.to_param, baby: new_attributes}, session: valid_session
        baby.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the baby" do
        baby = Baby.create! valid_attributes
        put :update, params: {id: baby.to_param, baby: valid_attributes}, session: valid_session
        expect(response).to redirect_to(baby)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        baby = Baby.create! valid_attributes
        put :update, params: {id: baby.to_param, baby: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested baby" do
      baby = Baby.create! valid_attributes
      expect {
        delete :destroy, params: {id: baby.to_param}, session: valid_session
      }.to change(Baby, :count).by(-1)
    end

    it "redirects to the babies list" do
      baby = Baby.create! valid_attributes
      delete :destroy, params: {id: baby.to_param}, session: valid_session
      expect(response).to redirect_to(babies_url)
    end
  end
end
