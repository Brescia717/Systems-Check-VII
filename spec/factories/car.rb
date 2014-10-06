FactoryGirl.define do
  factory :car do
    make "Foo"
    model "Bar"
    color "blue"
    year "2000"
    mileage "9001"
    description "It's over 9000!"

    association :manufacturer
  end
end
