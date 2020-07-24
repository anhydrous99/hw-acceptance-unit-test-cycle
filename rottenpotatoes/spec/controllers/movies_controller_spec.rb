require 'rails_helper'
require 'spec_helper'

describe MoviesController do
  let!(:first) { create(:movie, title: 'tst1', director: 'd1') }
  let!(:second) { create(:movie, title: 'tst2', director: 'd1') }
  let!(:third) { create(:movie, title: 'tst3') }
  let!(:fourth) { create(:movie, title: 'tst4', director: 'd2') }

  describe 'same_director' do
    context 'When a specified movie has a director' do
      it 'should finds movies with the same director' do
        get :same_director, { movie_id: 1 }
        expect(assigns(:similar_movies)[0].id).to eq(second.id)
      end
    end

    context 'When a specified movie has no director' do
      it 'should redirect to the home page' do
        get :same_director, { movie_id: 3 }
        expect(@reponse).to redirect_to(root_url)
      end
    end
  end
end