require "spec_helper"

describe UploaderMailer do
  describe "photo_uploaded" do
    let(:mail) { UploaderMailer.photo_uploaded }

    it "renders the headers" do
      mail.subject.should eq("Photo uploaded")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "recommendation_letter_uploaded" do
    let(:mail) { UploaderMailer.recommendation_letter_uploaded }

    it "renders the headers" do
      mail.subject.should eq("Recommendation letter uploaded")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
