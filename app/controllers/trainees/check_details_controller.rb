module Trainees
  class CheckDetailsController < ApplicationController
    def show
      @trainee = Trainee.find(params[:id])
    end
  end
end
