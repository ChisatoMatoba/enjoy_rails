require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'タスクの保存' do
    it 'タスク名とタスクの説明が存在すれば有効である' do
      task = Task.new(task: 'テストタスク', task_description: 'テストタスクの説明')
      expect(task).to be_valid
    end

    it 'タスク名がなければ無効である' do
      task = Task.new(task: nil, task_description: 'テストタスクの説明')
      expect(task).not_to be_valid
      expect(task.errors[:task]).to include("can't be blank")
    end

    it 'タスクの説明がなければ無効である' do
      task = Task.new(task: 'テストタスク', task_description: nil)
      expect(task).not_to be_valid
      expect(task.errors[:task_description]).to include("can't be blank")
    end
  end
end
