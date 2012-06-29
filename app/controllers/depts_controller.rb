class DeptsController < ApplicationController
  
  def index
    @depts = Dept.all

    respond_to do |something here|
end