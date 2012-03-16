# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end


module SignOut


 # The sign_out method calls:
 # - sign_out_attempt
 # - sign_out_success (if sign_out_attempt returns true)
 # - sign_out_failure (if sign_out_attempt returns false or raises a SecurityError)

 def sign_out(options=nil)
  begin
   sign_out_attempt(options) or raise SecurityError
   sign_out_success(options)
   return true
  rescue SecurityError
   sign_out_failure(options)
   return false
  end
 end


 # The sign_out method calls this first.
 #
 # You override this method to e.g.:
 # - prompt the user to save any of his open work
 # - clear the current user variable
 # - clear the current user id in the session
 #
 # If this method succeeds, then control goes to sign_out_success.
 #
 # If this method raises an error, then control goes to sign_out_failure.

 def sign_out_attempt(options=nil)
 end


 # The sign_out method calls this second,
 # iff sign_out_attempt succeeds.
 #
 # You override this method to e.g.:
 # - show the user a flash notice message saying "Goodbye..."
 # - redirect to the application home page

 def sign_out_success(options=nil)
 end


 # The sign_out method calls this second,
 # iff sign_out_attempt raises an exception.
 #
 # You override this method to e.g.:
 # - show the user a flash warning message saying "Problem..."
 # - redirect to a help page with a way to report the problem

 def sign_out_failure(options=nil)
 end

end
