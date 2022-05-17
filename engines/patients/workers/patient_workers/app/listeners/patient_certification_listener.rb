class PatientCertificationListener
    include Sneakers::Worker

    QUEUE_NAME = 'patient_created_queue'
    from_queue QUEUE_NAME, env: nil

    def work(msg)
        #data = ActiveSupport::JSON.decode(msg)
        puts msg
        puts 'Message Handler Patient Certification'
        puts 'Access patient data'
        #user = Patient.find_by(id: user_hash['id'])
        puts 'Create a PDF'
        puts 'Send Email'
        ack!
    rescue StandardError => e
        create_log(false, data, message: e.message)
        reject!
    end

  def create_log(success, payload, message = {})
    message = {
      success: success,
      payload: payload
    }.merge(message).to_json

    severity = success ? :info : :error
    Rails.logger.send(severity, message)
  end

end