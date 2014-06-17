require 'spec_helper'

describe ModelWriter do

  before { create_clean_user_rb }
  after { remove_user_rb }

  it 'writes schema info to the end of a file' do
    writer = ModelWriter.new(path: fixtures_path)
    data = instance_double(ModelData, name: 'user', content: "#  foo integer\n")

    writer.add_info(data)

    expect(user_rb_file).to eq user_filled_file
  end

  describe 'IO errors' do
    
    let(:unknown_file) { File.join(fixtures_path, 'unknown.rb') }

    after { FileUtils.rm_f(unknown_file) }

    it 'silently fail if the file does not exist' do
      writer = ModelWriter.new(path: fixtures_path)
      data = instance_double(ModelData, name: 'unknown', content: "\n")

      expect{ writer.add_info(data) }.not_to raise_error
      expect(File.exists?(unknown_file)).to eq false
    end
  end

end
