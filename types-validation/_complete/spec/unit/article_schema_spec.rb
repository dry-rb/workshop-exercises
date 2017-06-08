require "spec_helper"
require_relative "../../types_validation_exercises"

RSpec.describe ArticleFormSchema do
  subject(:schema) { ArticleFormSchema }

  it "accepts valid attributes" do
    input = {
      "title" => "Hello",
      "status" => "draft",
      "published_at" => "",
    }
    expect(schema.(input)).to be_success
  end

  it "requires published_at to be filld when status is 'published'" do
    invalid_input = {
      "title" => "Hello",
      "status" => "published",
      "published_at" => "",
    }

    valid_input = invalid_input.merge("published_at" => "2017-01-01")

    expect(schema.(invalid_input)).to be_failure
    expect(schema.(invalid_input).messages[:published_at].length).not_to be_zero
    expect(schema.(valid_input)).to be_success
  end
end
