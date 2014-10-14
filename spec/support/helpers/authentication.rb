module Helpers
 module Authentication
   def sign_in_as(user)
     mock_omni_auth_for(user)
     binding.pry
     visit root_path
     click_on "Sign in with Facebook"
   end

   def mock_omni_auth_for(user)
     mock_options = {
       provider: user.provider,
       uid: user.uid,
       info: {
         name: user.name,
         email: user.email,
         first_name: user.first_name
       },
       credentials: {
         token: 'abc123',
         expires_at: 9913309601
       }
     }
     OmniAuth.config.add_mock(user.provider.to_sym, mock_options)
   end
 end
end
