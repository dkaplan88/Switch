class DevisesController < ApplicationController
  
  def get_history
    @device = Elroy
    @get_history = JSON.parse(open("http://swtch.co/device/#{@device}/history").read)
  end
  # GET /devises
  # GET /devises.json
  def index
    @devises = Devise.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @devises }
    end
  end

  # GET /devises/1
  # GET /devises/1.json
  def show
    @devise = Devise.find(params[:id])
    @level = []
    @name = Devise.find(params[:id]).name 
    Devise.find(params[:id]).histories.each do |x|
      @level << x.percentage 
      @level << x.percentage 
      @level << x.percentage 
      @level << x.percentage 
    end
    
    @h = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:title][:text] = "#{@name}'s Light History"
      f.series(:name=>'Percentage of Light', :data=> @level, type: "areaspline", pointInterval: 24 * 3600 * 1000, pointStart: Time.utc(2012,"aug",1,20,15,1).to_i * 1000 )
      f.options[:xAxis][:type] = "datetime"
    end
      
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @devise }
    end
  end

  # GET /devises/new
  # GET /devises/new.json
  def new
    @devise = Devise.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @devise }
    end
  end

  # GET /devises/1/edit
  def edit
    @devise = Devise.find(params[:id])
  end

  # POST /devises
  # POST /devises.json
  def create
    @devise = Devise.new(params[:devise])

    respond_to do |format|
      if @devise.save
        #API CALL GOES HERE
        format.html { redirect_to @devise, notice: 'Devise was successfully created.' }
        format.json { render json: @devise, status: :created, location: @devise }
      else
        format.html { render action: "new" }
        format.json { render json: @devise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /devises/1
  # PUT /devises/1.json
  def update
    @devise = Devise.find(params[:id])

    respond_to do |format|
      if @devise.update_attributes(params[:devise])
        #API CALL GOES HERE
        format.html { redirect_to @devise, notice: 'Devise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @devise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devises/1
  # DELETE /devises/1.json
  def destroy
    @devise = Devise.find(params[:id])
    @devise.destroy
    #API CALL GOES HERE

    respond_to do |format|
      format.html { redirect_to devises_url }
      format.json { head :no_content }
    end
  end
end
