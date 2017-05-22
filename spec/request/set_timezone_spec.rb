require 'spec_helper'

describe 'sets the timezone', type: :request do

  before do
    #Rails server timezone is UTC...
    Time.zone =  'UTC'
  end

  context 'Australia' do
    before do

      #pretend we're in australia, always wanted to go there
      page.driver.browser.set_cookie "browser.timezone=Australia/Sydney"

      #visit a page that displays the rails time zone for this request
      visit '/timezone'
    end

    it 'sets the timezone properly' do
      expect(page).to have_content "Australia/Sydney"
    end

    it 'resets the time zone back to utc after each request' do
      expect(Time.zone.name).to eq 'UTC'
    end
  end

  context 'invalid timezone' do
    before do
      page.driver.browser.set_cookie "browser.timezone=Something/Invalid"
      visit '/timezone'
    end

    it 'does not raise an error' do
      expect(page).to have_content "UTC"
    end
  end

  context 'on the first request ever, there will be no cookie, and nothing happens' do

    before do
      #visit a page that displays the rails time zone for this request
      visit '/timezone'
    end

    it 'sets the timezone properly' do
      expect(page).to have_content "(GMT+00:00) UTC"
    end

  end

end
