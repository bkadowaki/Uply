require 'rails_helper'
require 'spec_helper'

describe WebsitesController do
	describe 'GET index' do
		it 'assigns @websites' do
			website = Website.create(:website)
			get :index
			expect(assigns(:websites)).to eq([website])
		end
	end

	describe 'POST create' do
		context 'with valid input' do
			before do
				website = attributes_for(:website)
				post :create, website 
			end
			it 'should save website record' do
				expect(Website.count).to eq(1)
			end
			it 'should redirect to show page' do
				expect(response).to redirect_to website_path
			end
		end	
		context 'with invalid input' do
			before do
				website = attributes_for(:website, title: nil, url: nil)
				post :create, website 
			end
			it 'should not be saved in the database' do
				expect(Website.count).to eq(0)
			end
			it 'should render new template' do
				expect(response).to render :new
			end
			it 'should set @website' do
				expect(assigns(:website)).to be_instance_of(Website)
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

end