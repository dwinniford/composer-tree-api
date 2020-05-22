class TreesController < ApplicationController
  before_action :set_tree, only: [:show, :update, :destroy]

  # GET /trees
  def index
    @user = User.find(session[:user_id])
    @trees = @user.trees

    render json: @trees
  end

  # GET /trees/1
  def show
    render json: @tree, include: [:notes]
  end

  # POST /trees
  def create
    @user = User.find(session[:user_id])
    @tree = @user.trees.build(tree_params)

    if @tree.save
      render json: @tree, status: :created, location: @tree
    else
      render json: @tree.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trees/1
  def update
    if @tree.update(tree_params)
      render json: @tree, include: [:notes]
    else
      render json: @tree.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trees/1
  def destroy
    @tree.notes.delete_all
    @tree.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tree
      @tree = Tree.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tree_params
      params.require(:tree).permit(:title, :description)
    end
end
