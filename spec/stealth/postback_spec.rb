RSpec.describe Stealth::Services::Postback do
  it "has a version number" do
    expect(Stealth::Services::Postback::VERSION).not_to be nil
  end

  xit "posts the message to the configured URL" do
    pending "Write tests"
  end

  xit "signs the request with the configured credentials" do
    pending "Write tests"
  end
end
