FactoryBot.define do
  factory :order do
    post_coad      {'123-4567'}
    city           {'横浜市西区'}
    banchi         {'青山15ー15'}
    phone_num      {'09012345678'}
    association :purchase

  end
end
