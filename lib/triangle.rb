require 'pry'

class Triangle
    attr_accessor :s1, :s2, :s3
    def initialize(s1, s2, s3)
        @s1 = s1 
        @s2 = s2
        @s3 = s3 
    end 

    def attrs 
        instance_variables.map {|ivar| instance_variable_get ivar}
    end
    
    def valid? 
        
        #Not good code right here. Needs to be fixed.
    #     truths = [
    #     self.s1 + self.s2 > self.s3,
    #     self.s1 + self.s3 > self.s2,
    #     self.s2 + self.s3 > self.s1,
    #     self.attrs.none? {|a| a <= 0}
    # ]
        s_attrs = self.attrs.sort()
        #Essentially, if the two smaller sides > largest side, it will be valid
        s_attrs[0..1].reduce(0, :+) > s_attrs[2] && self.attrs.none? {|a| a <= 0}
        
    end 
    

    def kind 
        # binding.pry
        if self.valid?
            diff_sides = self.attrs.uniq.size 
            diff_sides == 1 ? :equilateral : diff_sides == 2 ? :isosceles : :scalene
        else 
            raise TriangleError
        end 
    end 

    class TriangleError < StandardError
    end 
end

