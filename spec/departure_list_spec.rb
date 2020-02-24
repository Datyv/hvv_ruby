require 'spec_helper'

describe HvvRuby::DepartureList do
  it 'Departure List API call should be success' do
    station_name = 'Sierichstraße'
    res = HvvRuby::DepartureList.new(station_name).pull
    expect(res).to be_kind_of(Array)
  end
end
