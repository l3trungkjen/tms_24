require 'rails_helper'

describe Task do
  let(:number) {10}

  describe "Validation" do
    let(:task) {FactoryGirl.build :task}

    context "When Name is empty" do
      before {task.name = "Bai tap 1"}
      it {is_expected.not_to be_valid}
    end

    context "When Name is too long" do
      before do
        task.name = "x" * 150
        task.valid?
      end
      it {expect(task.errors[:name]).not_to be_present}
    end

    context "When description is empty" do
      before do
        task.description = "Mo ta ve bai tap 1"
        task.valid?
      end
      it {expect(task.errors[:description]).not_to be_present}
    end

    context "When description is too long" do
      before do
        task.description = "x" * 254
        task.valid?
      end
      it {expect(task.errors[:description]).not_to be_present}
    end
  end

  describe ".list_task" do
    context "When has list_task in subject_id" do
      let(:subject) {FactoryGirl.create :subject}
      let(:tasks) {FactoryGirl.create_list :task, number, subject: subject}
      let(:other_sub) {FactoryGirl.create :subject}
      let(:other_tasks) {FactoryGirl.create_list :task, number, subject: other_sub}
      it {expect(Task.list_task(subject)).to eq tasks}
      it {expect(Task.list_task(subject)).not_to eq (tasks + other_tasks)}
    end
  end
end
