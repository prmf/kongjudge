Factory.define :user do |f|
	f.sequence(:username) { |n| "User#{n}" }
	f.sequence(:email) { |n| "User#{n}@example.com" }
	f.password "abc123"
end
