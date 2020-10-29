require 'rails_helper'

RSpec.describe BabiesController, type: :controller do
  let!(:valid_session) { { user_id: current_user.id, baby_id: my_baby.id } }

  let!(:current_user) do
    create(:user, name: 'Usuario', last_name: 'Ficticio',
                  email: 'periccco@palotes')
  end

  let!(:my_baby) { create(:baby, user_id: current_user.id) }

  let!(:valid_attributes) do
    {
      'user_id' => valid_session[:user_id],'name' => 'Manolito',
      'last_name' => 'Gafotas', 'dob' => '2020-09-13',
      'gender' => 'niño', 'blood_type' => 'A+'
    }
  end

  let!(:invalid_attributes) do
    {
      'name' => '', 'last_name' => '', 'dob' => '',
      'gender' => 'niño', 'blood_type' => 'A+'
    }
  end

  describe "GET #index" do
    it "returns a success response" do
      Baby.create! valid_attributes
      get :index, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      baby = Baby.create! valid_attributes
      get :show, session: valid_session, params: { id: baby.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      baby = Baby.create! valid_attributes
      get :edit, params: { id: baby.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Baby" do
        expect {
          post :create, params: { baby: valid_attributes }, session: valid_session
        }.to change(Baby, :count).by(1)
      end

      it "redirects to babies index" do
        post :create, params: { baby: valid_attributes }, session: valid_session
        expect(response).to redirect_to(babies_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { baby: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { 'name' => 'Jacintito', 'last_name' => 'Gafotas', 'dob' => '2020-09-13', 'gender' => 'niño', 'blood_type' => 'AB+' }
      }
#
      it "updates the requested baby" do
        baby = Baby.create! valid_attributes
        baby.update(new_attributes)
        baby.reload
        expect(baby.name).to eq('Jacintito')
      end

      it "redirects to the babies index" do
        baby = Baby.create! valid_attributes
        put :update, params: { id: baby.to_param, baby: valid_attributes }, session: valid_session
        expect(response).to redirect_to(babies_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        baby = Baby.create! valid_attributes
        put :update, params: { id: baby.to_param, baby: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested baby" do
      baby = Baby.create! valid_attributes
      expect {
        delete :destroy, params: { id: baby.to_param }, session: valid_session
      }.to change(Baby, :count).by(-1)
    end

    it "redirects to the babies list" do
      baby = Baby.create! valid_attributes
      delete :destroy, params: { id: baby.to_param }, session: valid_session
      expect(response).to redirect_to(babies_path)
    end
  end
end
