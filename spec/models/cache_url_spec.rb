require 'rails_helper'

RSpec.describe CacheUrl, type: :model do
  subject { CacheUrl.new(
    url: "550 rivera st",
    stringified_data: "sladfjañlkdjfadjfasdjfakdjflakjdhfjkahelfhadjkfhaljkdhfjkadfjalhdjkfjasdbfaldfjhajdkfhjasldnvajdsljfh" 
  )}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a url" do
    subject.url=nil
    expect(subject).to_not be_valid
  end

  it "is not valid when length is too short" do
    subject.url="a"
    expect(subject).to_not be_valid
  end

  it "is not valid without a stringified_data" do
    subject.stringified_data=nil
    expect(subject).to_not be_valid
  end

  it "is not valid when length is too short" do
    subject.stringified_data="a"
    expect(subject).to_not be_valid
  end

end

