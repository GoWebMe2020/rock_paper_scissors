class MachineChoice

    CHOICES = [:rock, :paper, :scissors, :lizard, :spock]

    def machine_choice
        CHOICES.sample
    end

end