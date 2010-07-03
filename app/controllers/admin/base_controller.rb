class Admin::BaseController < ApplicationController
  before_filter :authorize
  
  layout 'admin'
end