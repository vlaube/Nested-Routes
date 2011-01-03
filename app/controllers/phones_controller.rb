class PhonesController < ApplicationController
  # GET /phones
  # GET /phones.xml
  def index
    @person = Person.find(params[:person_id])
    @phones = Phone.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @phones }
    end
  end

  # GET /phones/1
  # GET /phones/1.xml
  def show
    @phone = Phone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @phone }
    end
  end

  # GET /phones/new
  # GET /phones/new.xml
  def new
    @person = Person.find(params[:person_id])
    @phone = Phone.new
    @phone.person_id = @person.id
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @phone }
    end
  end

  # GET /phones/1/edit
  def edit
    @person = Person.find(params[:person_id])
    @phone = Phone.find(params[:id])
    @phone.person_id = @person.id
  end

  # POST /phones
  # POST /phones.xml
  def create
    @phone = Phone.new(params[:phone])

    respond_to do |format|
      if @phone.save
        format.html { redirect_to(person_phone_url(@phone.person_id, @phone), :notice => 'Phone was successfully created.') }
        format.xml  { render :xml => @phone, :status => :created, :location => @phone }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @phone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /phones/1
  # PUT /phones/1.xml
  def update
    @phone = Phone.find(params[:id])

    respond_to do |format|
      if @phone.update_attributes(params[:phone])
        format.html { redirect_to(person_phone_url(@phone.person_id, @phone), :notice => 'Phone was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @phone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /phones/1
  # DELETE /phones/1.xml
  def destroy
    @phone = Phone.find(params[:id])
    @phone.destroy

    respond_to do |format|
      format.html { redirect_to(person_phones_url(@phone.person_id)) }
      format.xml  { head :ok }
    end
  end
end
