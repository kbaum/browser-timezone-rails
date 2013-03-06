require 'spec_helper'


describe 'sets the timezone' do

  it 'sets the timezone properly' do
    visit '/timezone'
    save_and_open_page

  end

end
