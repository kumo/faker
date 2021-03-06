module Faker
  class Internet
    class << self
      def email(name = nil)
        [ user_name(name), domain_name ].join('@')
      end
      
      def free_email(name = nil)
        [ user_name(name), %w(gmail.com yahoo.com hotmail.com).rand ].join('@')
      end
      
      def user_name(name = nil)
        return name.scan(/\w+/).shuffle.join(%w(. _).rand).downcase if name
        
        [ 
          Proc.new { Name.first_name.gsub(/\W/, '').downcase },
          Proc.new { 
            [ Name.first_name, Name.last_name ].map {|n| 
              n.gsub(/\W/, '')
            }.join(%w(. _).rand).downcase }
        ].rand.call
      end
      
      def domain_name
        [ domain_word, domain_suffix ].join('.')
      end
      
      def domain_word
        Company.name.split(' ').first.gsub(/\W/, '').downcase
      end
      
      def domain_suffix
        %w(co.uk com us uk ca biz info name).rand
      end
      
      def url(protocol = nil)
        protocol ||= ["http", "https", "ftp"].rand
        
        base = [ "#{protocol}://#{domain_name}"]
        (rand(5)+1).times do 
          base << domain_word  
        end
        
        params = []
        if Kernel.rand > 0.5
          (rand(5)+1).times do
            params << "#{domain_word}=#{domain_word}"
          end
        end

        unless params.empty?
          "#{base.join '/'}/?#{params.join '&'}"
        else
          base.join '/'
        end

      end
    end
  end
end
