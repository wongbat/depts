class MembersController < ApplicationController

  def index
    @dept = Dept.find(params[:dept_id])
    @members = @dept.members.all

    respond_to do |format|
      format.html
      format.json { render :json => @members }
    end
  end

  def show
    @dept = Dept.find(params[:dept_id])
    @member = @dept.member.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @member }
    end
  end

  def new
    @dept = Dept.find(params[:dept_id])
    @member = @dept.members.build

    respond_to do |format|
      format.html
      format.json { render :json => @member }
    end
  end

  def create
    @dept = Dept.find(params[:dept_id])
    @member = @dept.members.build(params[:member])

    respond_to do |format|
      if @member.save
          format.html { redirect_to dept url(@member.dept_id) }
          format.json { render :json => @member }
      else
          format.html { render :action => 'new' }
          format.json { render :json => @member }
      end
    end
  end

  def edit
    @dept = Dept.find(params[:dept_id])
    @member = @dept.members.find(params[:id])
  end

  def update
    @dept = Dept.find(params[:dept_id])
    @member = @dept.members.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
         format.html { redirect_to dept_url(@member.dept_id)}
         format.json { render :json => @member }

      else
         format.html { render :action => 'edit' }
         format.json { render :json => @member }
      end
    end
  end

  def destroy
    @dept = Dept.find(params[:dept_id])
    @member = @dept.members.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to dept_url(@member.dept_id) }
      format.json { render :json => @member }
    end
  end
end
