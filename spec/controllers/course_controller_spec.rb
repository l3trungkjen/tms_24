require 'spec_helper'
require 'rails_helper'

describe CoursesController do

  let(:course) {FactoryGirl.create :course}
  let(:user_course) {FactoryGirl.create :user_course}
  let(:course_subject) {FactoryGirl.create :course_subject}

  describe 'GET #show' do
    context "is not logged" do
      it do
        get :show
        expect(response).to redirect_to sign_out_path
      end
    end

    context "is not join course" do
      it do
        get :show
        expect(response).to redirect_to sign_out_path
      end
    end

    context "is logged" do
      before do
        sign_in user
        get :show, id: course.id
      end
      after {sign_out user}

      it {is_expected.to render_template :show}

      it {expect(assigns(:course)).to eq course}
    end
  end
end
