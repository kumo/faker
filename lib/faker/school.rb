module Faker
  class School
    class << self
      def course_code
        Faker.bothify(Formats.rand).upcase
      end
      
      def course_name
        [
          Proc.new { [ School.course_level, School.subject_name ].join(' ') },
          Proc.new { "From %s to %s" % [ School.subject_name, School.subject_name ] },
          Proc.new { "%s studies" % [ School.subject_name ] },
          Proc.new { "%s basics" % [ School.subject_name ] },
          Proc.new { "%s techniques" % [ School.subject_name ] },
          Proc.new { "The %s way: a critical analysis" % [ School.subject_name ] },
          Proc.new { "Studies in %s and %s literature" % [ School.subject_name, School.subject_name ] },
          Proc.new { "%s %s in context" % [ School.course_level, School.subject_name ] }
        ].rand.call
      end
      
      def course_level
        ["Advanced", "Beginners", "Introduction to", "Intermediate", "Creative", "Understanding", "Approaching"].rand
      end
      
      def subject_name
        %w(Ruby PHP Perl Python French Latin Spanish Italian Japanese Korean Anime Art Geography History Science Sleeping Dreaming).rand
      end
    end
      
    
    Formats = [
      '??###',
      '?##???',
      '??##???',
      '?#####',
      '??##??',
      '??####'
  	]
  end
end