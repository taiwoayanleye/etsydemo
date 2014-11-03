class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :omniauthable, :omniauth_providers => [:twitter]

	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.email = auth.info.email
			user.password = Devise.friendly_token[0,20]
		end
	end

	# def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
 #    user = User.where(:provider => auth.provider, :uid => auth.uid).first
 #    if user
 #      return user
 #    else
 #      registered_user = User.where(:email => auth.uid + "@twitter.com").first
 #      if registered_user
 #        return registered_user
 #      else

 #        user = User.create(name:auth.extra.raw_info.name,
 #                            provider:auth.provider,
 #                            uid:auth.uid,
 #                            email:auth.uid+"@twitter.com",
 #                            password:Devise.friendly_token[0,20],
 #                          )
 #    end
 #  	end
 #  	end
     
validates :name, :email, :password, presence: true

has_many :listings, dependent: :destroy
has_many :sales, class_name: "Order", foreign_key: "seller_id"
has_many :purchases, class_name: "Order", foreign_key: "buyer_id"
end
