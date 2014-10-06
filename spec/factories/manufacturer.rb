FactoryGirl.define do
  factory :manufacturer do
    name "Adam"
    country "Catsville"

    association :car
  end
end
