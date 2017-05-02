class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :post_member?]
  before_action :authenticate_user!
  before_action :can_access?, only: [:show, :edit, :update, :destroy]
  
  # GET /posts
  # GET /posts.json
  def index
    if current_user.admin
      @posts = Post.all
    else
      @posts = current_user.posts
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @traveldays = Travelday.where(post_id: @post.id).order(created_at: :asc)
    @count = Array (1 .. @traveldays.count)
    # this also works
    # @traveldays = Travelday.where(post_id: @post).order(created_at: :asc)
    @total_budget = total_budget?(@traveldays)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.create!(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_path(@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_path(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      # permit means that those attributes are available for mass assignment
      # attributes not included in permit are still returned; it's just that
      # they are not available for mass assignment
      params.require(:post).permit(:content, :title)
    end
    
    def can_access?
      # if the user does not belong in the group AND is not admin
      if !current_user.posts.exists?(@post.id) && !current_user.admin
        flash[:notice] = "Not allowed!"
        redirect_to root_path
      end
    end
    
    def total_budget? (traveldays)
      budget = 0
      traveldays.each do |td|
        budget += td.budget
      end
      budget
    end
end
