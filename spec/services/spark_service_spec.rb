require 'rails_helper'

describe SparkService, type: :service do
  it 'should be able to build filters' do
    params_1 = { 'zip' => 87114 }
    params_2 = { 'zip' => 87114, 'minPrice' => 1500 }
    params_3 = { 'zip' => 87114, 'minPrice' => 1500, 'maxPrice' => 2000 }

    expect(SparkService.build_filter(params_1)).to eq("PostalCode Eq '#{params_1['zip']}'")

    expect(SparkService.build_filter(params_2)).to eq("PostalCode Eq '#{params_2['zip']}' And ListPrice Ge #{params_2['minPrice']}")
    
    expect(SparkService.build_filter(params_3)).to eq("PostalCode Eq '#{params_3['zip']}' And ListPrice Ge #{params_3['minPrice']} And ListPrice Le #{params_3['maxPrice']}")

  end
end
