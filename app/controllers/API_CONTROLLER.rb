require 'open-uri'

class ApiController < AppliacationController 
  respond_to :html, :json
  
  def get_history
    @device = Device.find(params[:id])
    @get_history = JSON.parse(open("http://swtch.co/device/#{@device}/history").read)
  end
  
  def get_schedule
    @device = Device.find(params[:id])
    @schedule = JSON.parse(open("http://swtch.co/device/#{@device}/schedule").read)
  end
  
  def get_logs
    @device = Device.find(params[:id])
    @logs = JSON.parse(open("http://swtch.co/device/#{@device}/logs").read)
  end
  
  
  def new_schedule_time #form to fill out specified scheduled action
    @action = Schedule.new 
  end

  def post_schedule_time #This triggers scheduled action
    @call = Schedule.find(params[:id])
    @device = @call.device
    @action = @call.action
    @time = @call.time

    if @call.save
      api_call = response.request(:post, "http://swtch.co/device/#{@device}/schedule/#{@action}/#{@time}")
      redirect_to "HomePage", notice: "Action Scheduled Successfully"
    else
      render new, notice: "oops try again" 
    end
  end

   
  def new #This initiats the action (TurnOff, TurnOn, Toggle, Dim, Pulse, Etc)
    @action = Call.new #form to fill out specified action details
  end
  
  def trigger #This triggers the action ie. TurnOff, TurnOn, Toggle, Dim, Pulse, Etc
    @call = Call.find(params[:id])
    @device = @call.device
    @action = @call.action 
    
    if @call.save
      api_call = response.request(:put, "http://swtch.co/device/#{@device}/#{@action}")
      redirect_to "HomePage", notice: "Action Triggered Successfully"
    else
      render new, notice: "oops try again" 
    end
  end
end