require 'spec_helper'

describe HvvRuby::CheckName do
  it 'Departure List API call should be success' do
    station_name = 'Hoheluftbrücke'
    res = HvvRuby::CheckName.new(name: station_name).pull
    expect(res).to be_kind_of(Hash)
  end
end
