require 'spec_helper'

describe ExtendedContent do

  it 'add meta data to the content' do
    content = "#  foo integer\n"
    extended_content = ExtendedContent.from(content)
    expect(extended_content).to eq %q(# == Schema Information
#
#  foo integer
)
  end
end
