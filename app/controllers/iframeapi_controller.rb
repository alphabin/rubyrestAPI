class  IframeapiController < ApplicationController
  def visit_iframe
    url_name = params[:url]
    #url_name.downcase!
    #do something here
    #return it here
    @resObject = ResponseIframe.new url_name
    @resObject.checkURL
    render json:@resObject.to_json
  end

end

