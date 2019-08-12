require_relative "cardspace.rb"

class Cells < CardSpace

    def initialize
        super do
            self.count <= 3
        end
    end

    def transfer_to(other_space, index)
        raise "That is not a valid card" unless count > index
        card = cards.delete_at(index)
        raise "#{card.to_s} cannot be transferred there" unless other_space.can_accept?(card)
        other_space.place(card)
        nil
    end

end