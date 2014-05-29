require_relative 'spec_helper'


describe Photo do
  it "should be a table in the database" do
    Photo.delete_all
    empty_array = Photo.all
    expect(empty_array).to eq([])
  end
  it "should be able to save the link for a photo" do
    Photo.create(source: 'http://fake_link')
    expect(Photo.last.source).to eq('http://fake_link')
  end
end
