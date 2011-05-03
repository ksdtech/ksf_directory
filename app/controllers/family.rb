KsfDirectory.controllers :family do
  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end
  
  get :index do
    @families = Family.all(:order => :last_name)
    render '/family/index'
  end
  
  get :show, :with => :id, :provides => [:html, :json] do
    family_id = params[:id].to_i
    @family = params[:reload] ? Family.reload(family_id) : Family.get_or_load(family_id)
    case content_type
    when :json
      return @family.to_json
    when :html
      render '/family/show'
    end
  end

  post :reload, :with => :id, :provides => [:html, :json] do
    family_id = params[:id].to_i
    family = Family.reload(family_id)
    case content_type
    when :json
      family.to_json
    when :html
      redirect_to url_for(:family, :show, :id => family_id)
    end
  end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end

  
end