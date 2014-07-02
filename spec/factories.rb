FactoryGirl.define do
	factory :user do
	    name     "Michael Hartl"
	    email    "michael@example.com"
	    password "foobar"
	    password_confirmation "foobar"
	  factory :admin do
	  	admin true
	  end 
	end 

  factory :team do
  	name "Big Blue"
  end

  factory :wallpost do
  	content "lorem ipsum"
  	user
  end 

end 
