require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe TextMessagesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # TextMessage. As you add validations to TextMessage, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TextMessagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all text_messages as @text_messages" do
      text_message = TextMessage.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:text_messages)).to eq([text_message])
    end
  end

  describe "GET #show" do
    it "assigns the requested text_message as @text_message" do
      text_message = TextMessage.create! valid_attributes
      get :show, {:id => text_message.to_param}, valid_session
      expect(assigns(:text_message)).to eq(text_message)
    end
  end

  describe "GET #edit" do
    it "assigns the requested text_message as @text_message" do
      text_message = TextMessage.create! valid_attributes
      get :edit, {:id => text_message.to_param}, valid_session
      expect(assigns(:text_message)).to eq(text_message)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new TextMessage" do
        expect {
          post :create, {:text_message => valid_attributes}, valid_session
        }.to change(TextMessage, :count).by(1)
      end

      it "assigns a newly created text_message as @text_message" do
        post :create, {:text_message => valid_attributes}, valid_session
        expect(assigns(:text_message)).to be_a(TextMessage)
        expect(assigns(:text_message)).to be_persisted
      end

      it "redirects to the created text_message" do
        post :create, {:text_message => valid_attributes}, valid_session
        expect(response).to redirect_to(TextMessage.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved text_message as @text_message" do
        post :create, {:text_message => invalid_attributes}, valid_session
        expect(assigns(:text_message)).to be_a_new(TextMessage)
      end

      it "re-renders the 'new' template" do
        post :create, {:text_message => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested text_message" do
        text_message = TextMessage.create! valid_attributes
        put :update, {:id => text_message.to_param, :text_message => new_attributes}, valid_session
        text_message.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested text_message as @text_message" do
        text_message = TextMessage.create! valid_attributes
        put :update, {:id => text_message.to_param, :text_message => valid_attributes}, valid_session
        expect(assigns(:text_message)).to eq(text_message)
      end

      it "redirects to the text_message" do
        text_message = TextMessage.create! valid_attributes
        put :update, {:id => text_message.to_param, :text_message => valid_attributes}, valid_session
        expect(response).to redirect_to(text_message)
      end
    end

    context "with invalid params" do
      it "assigns the text_message as @text_message" do
        text_message = TextMessage.create! valid_attributes
        put :update, {:id => text_message.to_param, :text_message => invalid_attributes}, valid_session
        expect(assigns(:text_message)).to eq(text_message)
      end

      it "re-renders the 'edit' template" do
        text_message = TextMessage.create! valid_attributes
        put :update, {:id => text_message.to_param, :text_message => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested text_message" do
      text_message = TextMessage.create! valid_attributes
      expect {
        delete :destroy, {:id => text_message.to_param}, valid_session
      }.to change(TextMessage, :count).by(-1)
    end

    it "redirects to the text_messages list" do
      text_message = TextMessage.create! valid_attributes
      delete :destroy, {:id => text_message.to_param}, valid_session
      expect(response).to redirect_to(text_messages_url)
    end
  end

end
