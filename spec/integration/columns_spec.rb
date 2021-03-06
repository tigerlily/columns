require 'spec_helper'

describe Columns do

  it { is_expected.to respond_to(:execute) }

  describe 'executes the application' do
    before { create_clean_user_rb }
    after { remove_user_rb }

    specify 'on virgin models', :speed => 'slow' do
      schema_dir = 'spec/fixtures'
      models_dir = 'spec/fixtures'

      Columns.execute(schema_dir: schema_dir, models_dir: models_dir)

      expect(user_rb_file).to eq integration_user_filled_file
    end

    skip 'on already annotated models', :speed => 'slow' do
    end

  end

  context 'when there is no schema' do

    it 'exits with status code 1', :speed => 'slow' do
      # Silence output.
      allow_any_instance_of(Columns::Application).to receive(:puts)
      schema_dir = 'spec/'
      models_dir = 'spec/fixtures'

      begin
        Columns.execute(schema_dir: schema_dir, models_dir: models_dir)
      rescue SystemExit => ex
        expect(ex.status).to eq 1
      end
    end

  end

end
