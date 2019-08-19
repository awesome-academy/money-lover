require "rails_helper"
require "sessions_helper"
require "ffaker"

RSpec.describe Admin::CategoriesController, type: :controller do
  let!(:list_categories) {FactoryBot.create_list :category, 5}
  let!(:list_category_users) {FactoryBot.create_list :categories_user, 10, category_id: list_categories[0].id}

  context "no login" do
    describe "GET #index" do
      it "should found" do
        get :index
        expect(response).to have_http_status(302)
      end

      it "should redirect login page" do
        get :index
        expect(response).to redirect_to(login_path)
      end
    end

    describe "GET #new" do
      it "should found" do
        get :new
        expect(response).to have_http_status(302)
      end

      it "should redirect login page" do
        get :new
        expect(response).to redirect_to(login_path)
      end
    end

    describe "POST #create" do
      it "should found" do
        post :create
        expect(response).to have_http_status(302)
      end
      it "should redirect login page" do
        post :create
        expect(response).to redirect_to(login_path)
      end
    end
  end

  context "logined" do
    before do
      @user = FactoryBot.create :user, admin: true
      log_in @user
    end

    describe "GET #index" do
      before do
        get :index
      end
      it "should render index page" do
        expect(response).to render_template(:index)
      end

      it "should be success" do
        expect(response).to have_http_status(200)
      end

      it "populates category no user id" do
        expect(assigns(:categories)).to eq([])
      end

      it "populates category have user id" do
        expect(assigns(:list_categories).second[1]).to eq(list_categories.second.id)
      end
    end

    describe "GET #new" do
      it "should be success" do
        get :new
        expect(response).to have_http_status(200)
      end

      it "should render new page" do
        get :new
        expect(response).to render_template(:new)
      end

      it "should create new category" do
        get :new
        expect(assigns(:category)).to be_a_new(Category)
      end
    end

    describe "POST #create" do
      context "create successful" do
        before do
          post :create, params: {category: FactoryBot.attributes_for(:category)}
        end
        it "should create new category" do
          expect{
            post :create, params: {category: FactoryBot.attributes_for(:category)}
          }.to change(Category, :count).by(1)
        end

        it "should redirect admin categories page" do
          expect(response).to redirect_to(admin_categories_path)
        end

        it "should flash success" do
          expect(flash[:success]).to match(I18n.t("alert.created", obj: Category.name))
        end
      end

      context "create failed" do
        before do
          post :create, params: {category: {name: nil, parent_id: nil}}
        end
        it "should create fail with no name" do
          expect{
            post :create, params: {category: {name: nil, parent_id: nil}}
          }.to change(Category, :count).by(0)
        end
        it "should render index page" do
          expect(response).to render_template(:index)
        end
        it "should get category select" do
          expect(assigns(:categories)).to match_array(list_categories)
        end
      end
    end

    describe "PUT update" do
      context "update success" do
        before do
          put :update, params: {id: list_categories.first, category: FactoryBot.attributes_for(:category)}
        end
        it "should flash success" do
          expect(flash[:success]).to match(I18n.t("alert.updated", obj: Category.name))
        end
        it "should redirect admin categories page" do
          expect(response).to redirect_to(admin_categories_path)
        end
        it "should found" do
          expect(response).to have_http_status(302)
        end
        it "should number categories no change" do
          expect{
            put :update, params: {id: list_categories.first, category: FactoryBot.attributes_for(:category)}
          }.to change(Category, :count).by(0)
        end
      end

      context "update failed" do
        before do
          put :update, params: {id: list_categories.first, category: {name: nil, parent_id: nil}}
        end

        it "should render index" do
          expect(response).to render_template(:index)
        end

        it "should show categories except category is updated failed" do
          list_categories.delete(list_categories.first)
          expect(assigns(:categories)).to match_array(list_categories)
        end

        it "should success" do
          expect(response).to have_http_status(200)
        end

        it "should number categories no change" do
          expect{
            put :update, params: {id: list_categories.first, category: {name: nil, parent_id: nil}}
          }.to change(Category, :count).by(0)
        end
      end
    end

    describe "PATCH update" do
      context "update success" do
        before do
          patch :update, params: {id: list_categories.first, category: FactoryBot.attributes_for(:category)}
        end
        it "should flash success" do
          expect(flash[:success]).to match(I18n.t("alert.updated", obj: Category.name))
        end
        it "should redirect admin categories page" do
          expect(response).to redirect_to(admin_categories_path)
        end
        it "should found" do
          expect(response).to have_http_status(302)
        end
        it "should number categories no change" do
          expect{
            patch :update, params: {id: list_categories.first, category: FactoryBot.attributes_for(:category)}
          }.to change(Category, :count).by(0)
        end
      end

      context "update failed" do
        before do
          patch :update, params: {id: list_categories.first, category: {name: nil, parent_id: nil}}
        end

        it "should render index" do
          expect(response).to render_template(:index)
        end

        it "should show categories except category is updated failed" do
          list_categories.delete(list_categories.first)
          expect(assigns(:categories)).to match_array(list_categories)
        end

        it "should success" do
          expect(response).to have_http_status(200)
        end

        it "should number categories no change" do
          expect{
            patch :update, params: {id: list_categories.first, category: {name: nil, parent_id: nil}}
          }.to change(Category, :count).by(0)
        end
      end
    end

    describe "DELETE #destroy" do
      before do
        delete :destroy, params: {id: list_categories.first}, xhr: true
      end

      it "should success" do
        expect(response).to have_http_status(200)
      end

      it "should status be success" do
        expect(assigns(:status)).to eq(:success)
      end
    end
  end
end
