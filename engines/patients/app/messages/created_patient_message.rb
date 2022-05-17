class CreatedPatientMessage < BaseMessage

    def initialize(first_name = nil, last_name = nil, hin = nil)
        @first_name = first_name
        @last_name = last_name
        @hin = hin
        @message_topic = 'patient_created_event'
        @message = "A new patient has been created"
    end

    def first_name
        @first_name
    end

    def last_name
        @last_name
    end

    def hin
        @hin
    end

    def get_queue
        "patient_created_queue"
    end
end
