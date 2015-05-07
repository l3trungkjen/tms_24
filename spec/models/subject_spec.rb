require 'rails_helper'

describe Subject do

  let(:subject) {FactoryGirl.create :subject}

  subject {Subject}

  describe "check field" do
    it {is_expected.to respond_to :name}
    it {is_expected.to respond_to :length}
    it {is_expected.to respond_to :description}
    it {is_expected.to respond_to :user_subjects}
  end

  describe "validation" do
    context "when input is valid" do
      it {is_expected.to be_valid}
    end

    context "when name is null" do
      before {subject.name = ""}
      it {is_expected.not_to be_valid}
    end

    context "when name is too long charset" do
      before {subject.name = "a" * 255}
      it {is_expected.not_to be_valid}
    end

    context "when length is null" do
      before {subject.length = ""}
      it {is_expected.not_to be_valid}
    end

    context "when length is too long" do
      before {subject.length = 10}
      it {is_expected.not_to be_valid}
    end

    context "when length not is number" do
      before {subject.length = "3NaN"}
      it {is_expected.not_to be_valid}
    end

    context "when length is entry" do
      before {subject.description = ""}
      it {is_expected.not_to be_valid}
    end

    context "when length is too long charset" do
      before {subject.description = "abc" * 255}
      it {is_expected.not_to be_valid}
    end
  end
end
