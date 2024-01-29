class LinksController < ApplicationController
  before_action :authenticate_user!, except: [ :redirect_to_original, :check_password_link ]
  before_action :set_link, only: [ :show, :edit, :update, :destroy, :redirect_to_original, :check_password_link, :daily_accesses, :list_accesses ]
  before_action :same_user, only: [ :show, :edit, :update, :destroy ]

  # GET /links or /links.json
  def index
    @links = current_user.links
  end

  # GET /links/1 or /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = current_user.links.build
    @link.user = current_user
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links or /links.json
  def create
    #params p
    @link = Link.new(link_params)
    @link.user = current_user

      if @link.save
        redirect_to link_url(@link), notice: "Link was successfully created." 
      else
        render :new, status: :unprocessable_entity 
      end
  end

  # PATCH/PUT /link/1 or 
  def update
      if @link.update(link_params)
        redirect_to link_url(@link), notice: "Link was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  # DELETE /links/1 or /links/1.json
  def destroy
    @link.destroy!
    redirect_to links_url, notice: "Link was successfully destroyed."
  end

  # GET /link/slug
  def redirect_to_original
    if @link.type == "PrivateLink"
      render "links/form_password" and return
    end
    res = @link.redirect
    if res[:success]
      original_url = @link.url.start_with?('http://', 'https://') ? @link.url : "http://#{@link.url}"
      LinkAccess.create(link_id: @link.id, ip: request.remote_ip)
      redirect_to original_url, allow_other_host: true
    else
      flash.now[:error] = res[:message]
      render file: "#{Rails.root}/public/#{res[:status]}.html", layout: false
    end
  end

  # POST /link/password/slug
  def check_password_link
    res = @link.redirect(params[:password])
  
    if res[:success]
      original_url = @link.url.start_with?('http://', 'https://') ? @link.url : "http://#{@link.url}"
      LinkAccess.create(link_id: @link.id, ip: request.remote_ip)
      redirect_to original_url, allow_other_host: true
    else
      flash.now[:error] = res[:message]
      render "links/form_password"
    end
  end

  def daily_accesses
    @accesses_by_day = @link.link_accesses.group_by { |access| access.created_at.to_date }
  end

  def list_accesses
    @accesses = @link.link_accesses
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      if params[:id]
        @link = Link.find(params[:id])
      elsif params[:slug]
        @link = Link.find_by(slug: params[:slug])
      end
    end

    # Only allow a list of trusted parameters through.
    def link_params
      if params[:link]
        params.require(:link).permit(:slug, :url, :name, :type, :expiration_date, :password, :ip)
      end
    end

    def same_user
      if @link.user != current_user
        render file: "#{Rails.root}/public/403.html", layout: false
      end
    end

end
