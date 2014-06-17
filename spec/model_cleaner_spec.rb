require 'spec_helper'

describe ModelCleaner do

  before do
    create_user_rb
  end

  after do
    remove_user_rb
  end

  it 'cleans a ruby model' do
    ModelCleaner.clean(user_rb_path)
    expect(user_rb_file).to eq user_cleaned_file
  end

  it 'silently fail if the file does not exist' do
    expect{
      ModelCleaner.clean('~/does_not_exist_file_123412341234.rb')
    }.not_to raise_error
  end
end
