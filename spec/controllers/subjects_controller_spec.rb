require 'spec_helper'
require 'rails_helper'

describe SubjectsController, type: :controller do
  include Devise::TestHelpers

  let(:course) {FactoryGirl.create :course}
  let(:subject) {FactoryGirl.create :subject}
  let(:course_subject) {FactoryGirl.create :course_subject, course: course, subject: subject}
  let(:user) {FactoryGirl.create :user}
  let(:task) {FactoryGirl.create :task, subject: subject}

  before do
    sign_in user
  end

  describe "GET show" do
    context "show course & subjects" do
      before do
        get :show, course_id: course.id, id: subject.id
      end
      it {expect(assigns[:course]).to eq course}
      it {expect(assigns[:subject]).to eq subject}
      it {is_expected.to render_template :show}
    end
  end

  describe "PATCH update" do
    let(:valid_params) do
      {
        tasks_attributes: user_tasks_params
      }
    end
    let(:user_tasks_params) do
      {
        user_id: user.id,
        status: 1
      }
    end
    let(:tasks_params) do
      {
        id: task.id,
        user_tasks_attributes: user_tasks_params
      }
    end
    context "Update user_tasks" do
      before do
        patch :update, course_id: course.id, id: subject.id, subject: valid_params
      end
      it {expect(assigns[:course]).to eq course}
      it {expect(assigns[:subject]).to eq subject}
      it "when the subject saves successfully" do
        allow(subject).to receive(:save).and_return(true)
      end
      it "when the subject saves failure" do
        allow(subject).to receive(:save).and_return(false)
      end
      it {expect(subject).to redirect_to [course, subject]}
    end
  end
end
