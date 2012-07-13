class User < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  
  attr_accessible :blog_name, :name, :user_name, :password_plain, :password_plain_confirmation
  
  validates_presence_of :name, :blog_name, :user_name
  validates :name, :uniqueness => true

  validates :password_plain, :confirmation => true
  attr_accessor :password_plain_confirmation
  attr_reader :password_plain
  
  validate :password_must_be_present

  class << self
  	def authenticate(user_name, password)
  		if user = find_by_user_name(user_name)
    		if user.password ==	encrypt_password(password, user.password_salt)
    			user
    		end
      end
  	end

		def encrypt_password(password_plain, password_salt)
    	Digest::SHA2.hexdigest password_plain + 'secret' + password_salt
    end
  end

  def password_plain= (password_plain)
  	@password_plain = password_plain

  	if password_plain.present?
  		generate_salt
  		self.password = self.class.encrypt_password password_plain, password_salt
  	end
  end

  private
    def password_must_be_present
    	errors.add(:password_plain, 'Missing Password') unless password.present?
    end

    def generate_salt
    	self.password_salt = rand.to_s
    end 

end
