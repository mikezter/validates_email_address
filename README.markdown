ValidatesEmailAddress
=====================

This is a dead simple ActiveRecord plugin to validate email addresses.
It uses this RegEx:
    /\A([-A-Za-z0-9_\.]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
in conjunction with `validates_format_of`.


Example
-------

    class User < ActiveRecord::Base
      validates_email_address :email
    end

This is a first timer, so please be patient and drop me a comment with suggestions.

Copyright (c) 2009 Michael Strüder, released under the MIT license

