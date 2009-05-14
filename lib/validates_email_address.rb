module ValidatesEmailAddress
  def self.included(base)  
    base.send :extend, ClassMethods
  end  

  module ClassMethods
    def validates_email_address(*args)
      options = args.extract_options!
      options[:with] = /\A([-A-Za-z0-9_\.]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
      self.validates_format_of(args, options)
    end
  end
  
end
