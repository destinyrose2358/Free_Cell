require_relative "cardspace.rb"

class Cells < CardSpace

    def initialize
        super do
            self.count <= 3
        end
    end

end