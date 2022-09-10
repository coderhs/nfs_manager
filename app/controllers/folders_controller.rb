class FoldersController < ApplicationController
  def index
    @folders = ParseFile::Export.parse(Rails.configuration.settings[:exports])
  end
end
