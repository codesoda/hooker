# Fires a webhook and updates the 'Call' record with the outcome
class CallHookWorker
  include Sidekiq::Worker

  def perform(id)

    call = ::Call.find id
    attempt = call.attempts.build
    begin
      body = { event: call.event_type, data: call.data }
      response = RestClient.post call.hook.url, body, content_type: :json, accept: :json, timeout: 10
      attempt.http_code = response.code
      attempt.http_status = response.body
      attempt.status = status_from_code(response.code)

      byebug

      call.status = Call.statuses[:successful]
    rescue => e
      byebug
      # still not working, give up
      if call.created_at < 10.minutes.ago
        call.status = Call.statuses[:failed]

      # try again later
      else
        call.status = Call.statuses[:pending]
      end
    ensure
      attempt.save!
      call.last_attempt = attempt
      call.save!
    end
  end

  def status_from_code code
    if code >= 200 && code <= 300
      Attempt.statuses[:success]
    else
      Attempt.statuses[:failed]
    end
  end
end
