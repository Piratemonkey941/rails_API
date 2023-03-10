class BlogsController < ApplicationController
    before_action :find_blog, only: [:show, :update, :destroy]
  
    def index
      blogs = Blog.all
      render json: blogs
    end
  
    def show
      render json: @blog
    end
  
    def create
      blog = Blog.new(blog_params)
  
      if blog.save
        render json: blog, status: :created
      else
        render json: blog.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @blog.update(blog_params)
        render json: @blog
      else
        render json: @blog.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
    
      @blog.destroy
  
      head :no_content
      render json: {message: "Blog Deleted"}, status: :ok
    end
  
    private
  
    def find_blog
      @blog = Blog.find(params[:id])
    end
  
    def blog_params
      params.require(:blog).permit(:title, :content, :image_path)
    end
  end
  