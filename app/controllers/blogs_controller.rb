class BlogsController < ApplicationController
    before_action :find_blog, only: [:show, :update, :destroy]

    def index
        @blogs = Blog.all
        render json: @blogs
    end

    def show
        render json: @blog
    end

    def create
        @blog = Blog.new(blog_params)
        if @blog.save
            render json: @blog
        else
            render error: {error: 'Unable to create blog'}, status: 400
        end
    end

    def update
        if @blog
            @blog.update(blog_params)
            render json: {message: 'blog updated successfully'}, status: 200
        else
            render json: {message: 'Unable to update blog'}, status: 400
        end
    end

    def destroy
        if @blog
            @blog.destroy
            render json: {message: 'blog sucessfully deleted'}, status: 200
        else
            render json: {message: 'unable to delete blog'}, status: 400
        end
    end


    
    private

    def blog_params
        params.permit(:title, :body, :image, :image_name)
    end
    
    def find_blog
        @blog = Blog.find(params[:id])
    end
end
