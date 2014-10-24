require 'rails_helper'
require 'spec_helper'

describe CommentsController do
  describe 'POST create' do
    context 'with valid input' do
      before do
        set_current_user
        @website = create(:website)
        post :create, website_id: @website.id, comment: attributes_for(:comment)
      end
      it 'should save a new comment to the database' do
        expect(Comment.count).to eq(1) 
      end
      it 'should belong to a website' do
        expect(Comment.first.website_id).to eq(@website.id)
      end
      it 'should belong to a user' do
        expect(Comment.first.user_id).to eq(@user.id)
      end
      it 'should redirect to website show page' do
        expect(response).to redirect_to(website_path(@website))
      end
    end
    
    context 'with invalid input' do
      before do
        set_current_user
        @website = create(:website)
        post :create, website_id: @website.id, comment: attributes_for(:comment, text: "")
      end 
      it 'should not save to the database' do
        expect(Comment.count).to eq(0)
      end
      it 'should render template website show' do
        expect(response).to render_template('websites/show')
      end
    end
  end
  
  describe "POST up" do
    before do
      @comment = create(:comment)
      @website = create(:website)
      set_current_user
      post :up, website_id: @website.id, id: @comment.id, user_id: @user.id, format: 'js'
    end
    context 'with valid input' do
      it 'should increase up count on comment' do
        expect(@comment.ups.count).to eq(1)
      end
      it 'should belong to comment' do
        expect(Up.first.upable_id).to eq(@comment.id)
      end
      it 'should belong to comment type' do
        expect(Up.first.upable_type).to eq("Comment")
      end
      it 'should belong to the current_user' do
        expect(Up.first.user_id).to eq(@user.id)
      end
    end
  
    context 'with invalid input' do
      it 'should only allow a user to up once on a comment' do
        post :up, website_id: @website.id, id: @comment.id, user_id: @user.id, format: 'js'
        expect(@comment.ups.count).to eq(1)
      end
    end
  end
end
