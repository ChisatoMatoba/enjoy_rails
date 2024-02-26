require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'ユーザーが新しいタスクを作成する' do
    visit new_task_path
    fill_in 'タスク名', with: '新しいタスク'
    fill_in 'タスクの説明', with: '新しいタスクの説明'
    click_button '登録'

    expect(page).to have_content '新しいタスク'
    expect(page).to have_content '新しいタスクの説明'
  end
end
