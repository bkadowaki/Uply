require 'rails_helper'
require 'spec_helper'

describe WebsitesController do
	describe 'GET index' do
		it 'assigns @websites' do
			website = create(:website)
			get :index
			expect(assigns(:websites)).to eq([website])
		end
	end
  
  describe 'GET new' do
    it 'assigns @website' do
      get :new
      expect(assigns(:website)).to be_instance_of(Website)
    end
  end

	describe 'POST create' do
		context 'with valid input' do
			before do
				post :create, website: attributes_for(:website)
			end
			it 'should save website record' do
				expect(Website.count).to eq(1)
			end
			it 'should redirect to show page' do
        website = Website.first
				expect(response).to redirect_to website_path(website)
			end
		end	

		context 'with invalid input' do
			before do
				post :create, website: attributes_for(:website, title: 1234, url: 1234) 
			end
			it 'should not be saved in the database' do
				expect(Website.count).to eq(0)
			end
			it 'should render new template' do
				expect(response).to render_template(:new)
			end
			it 'should set @website' do
				expect(assigns(:website)).to be_instance_of(Website)
			end 
		end

    context 'with nil values of title, desc, and category' do
      before do
        post :create, website: attributes_for(:website, title: nil, description: nil)
      end
      it 'should generate the title if title is nil' do
        expect(Website.first.title).to be_truthy 
      end
      it 'should generate the desc if desc is nil' do
        expect(Website.first.description).to be_truthy 
      end
      it 'should generate the category if category is nil' do
        expect(Website.first.category_id).to be_truthy
      end
    end
	end

	describe 'GET show' do
		it 'should assign @website' do
			website = create(:website)
			get :show, id: website.id
			expect(assigns(:website)).to eq(website)
		end
	end
  
  describe 'GET edit' do
    it 'should assign @website' do
      website = create(:website)
      get :edit, id: website.id
      expect(assigns(:website)).to eq(website)
    end
  end
  
  describe 'PUT Update' do
    context 'with valid input' do
      before do
        @website = create(:website)
        @website.title = "Techcrunch"
        put :update, id: @website.id, website: @website.attributes
      end
      it 'should save the changes from the update' do
        expect(@website.title).to eq('Techcrunch')
      end
      it 'should redirect to website show page' do
        expect(response).to redirect_to(website_path(@website))
      end
    end
    
    context 'with invalid input' do
      before do
        @website = create(:website)
        @website.title = ""
        put :update, id: @website.id, website: @website.attributes
        @website.reload
      end
      it 'should not save the changes from the update' do
        expect(@website.title).to eq('Techcrunchie')
      end
      it 'should render the edit template' do
        expect(response).to render_template(:edit)
      end
    end
  end
end
