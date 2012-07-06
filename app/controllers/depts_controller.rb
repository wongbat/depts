class DeptsController < ApplicationController

  def index
    @depts = Dept.all

    respond_to do |format|
      format.html
      format.json { render :json => @depts }
    end
  end

  def show
    @dept = Dept.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @dept }
    end
  end

  def new
    @dept = Dept.new(params[:name])

    respond_to do |format|
      format.html
      format.json { render :json => @dept }
    end
  end

  def create
    @dept.new(params[:dept])

    respond_to do |format|
      if @dept.save
         format.html { redirect_to :action => 'index' }
         format.json { render :json => @dept }
      else
         format.html { render :action => 'new' }
         format.json { render :json => @dept }
      end
    end
  end

  def edit
    @dept = Dept.find(params[:id])
  end

  def update
    @dept = Dept.find(params[:id])

    respond_to do |format|
      if @dept.update_attributes(params[:dept])
         format.html { redirect_to :action => 'index'}#, :id => @dept }
         format.json { render :json => @dept }

      else
         format.html { redirect_to :action => 'edit' }
         format.json { render :json => @dept }
      end
    end
  end

  def destroy
    @dept = Dept.find(params[:id])
    @dept.destroy

    respond_to do |format|
      format.html { redirect_to :action => 'index' }
      format.json { render :json => @dept }
    end
  end
end
