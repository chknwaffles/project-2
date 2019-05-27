class User < ApplicationRecord
    validates :password, length: {minimum: 6}
    
    def password
        @password
    end

    def password=(plain_pw)
        self.password_hash = Argon2::Password.create(plain_pw)
    end

    def authenticate(plain_pw)
        if Argon2::Password.verify_password(plain_pw, self.password_hash)

        end
    end
end
