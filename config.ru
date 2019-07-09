require './config/environment.rb'

run ApplicationController
use Rack::MethodOverride
use UsersController
use TrailsController
